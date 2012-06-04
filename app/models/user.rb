require 'digest/sha2'
require 'ezcrypto'

require 'gravtastic'

class User < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :firstname, :full_address, :lastname, :latitude, :login, :longitude, :password, :password_confirmation, :encrypted_password, :picture, :postalCode, :remember_token

  has_secure_password

  #VALIDATIONS
  #validates :firstname, :lastname, :presence => true, :length => { maximum: 50}
  EMAIL_REGEX_VALIDATION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
            :format => { :with => EMAIL_REGEX_VALIDATION},
            uniqueness: { case_sensitive: false}

  validates :login, :presence => true, uniqueness: true,  :length => { minimum: 4}

  validates :password, :length => { :minimum => 6 }
  validates :password_confirmation, presence: true

  #for using the gravtastic gem/plugin
  include Gravtastic
  gravtastic :secure => true#, :size => 120
  geocoded_by :full_address

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  after_validation :geocode,  :if => lambda { |obj| obj.full_address_changed? }

  #has_many :topics


  def full_name
  end


  def full_address
     [address, postalCode, city, country].compact.join(', ')
  end

  def self.authenticate(login, password)
    user = find_by_login(login)
    #if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_salt)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end


  def self.authenticate_save(login, password)
    user = find_by_login(login)
    if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  protected
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_digest = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


  def password_non_blank
    errors.add_to_base("Missing password" ) if password.blank?
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
