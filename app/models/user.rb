require 'digest/sha2'
require 'base64'
require 'gravtastic'
require "execjs"

class User < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :firstname, :full_address, :lastname, :latitude, :login, :longitude, :password, :password_confirmation, :encrypted_password, :picture, :postalCode, :remember_token

  has_secure_password   #autogenerate the user encrypted password in the "password_digest" attribute
  
  has_many :posts
  

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
  gravtastic #:secure => true, :size => 20
  
  geocoded_by :address
  after_validation :geocode,  :if => lambda { |obj| obj.address_changed? }
  #geocoded_by :full_address
  #after_validation :geocode,  :if => lambda { |obj| obj.full_address_changed? }

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token


  def full_name
    firstname.nil? ? lastname : lastname + " " + firstname unless firstname.nil? or lastname.nil?
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



  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
