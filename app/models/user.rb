require 'digest/sha1'
require 'ezcrypto'

require 'gravtastic'

class User < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :firstname, :full_address, :lastname, :password, :password_confirmation, :latitude, :login, :longitude, :picture, :postalCode, :remember_me

  validates :firstname, :lastname
  EMAIL_REGEX_VALIDATION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
            :format => { :with => EMAIL_REGEX_VALIDATION},
            uniqueness: { case_sensitive: false}

  validates :login, :presence => true, :length => { minimum: 4}
  validates :password, :length => { :minimum => 6 }
  validates :password_confirmation, presence: true

  before_save { |user| user.email = email.downcase }

  #for using the gravtastic gem/plugin
  include Gravtastic
  gravtastic :secure => true, :size => 120

  #geocoded_by :full_address
  #after_validation :geocode,
  #     :if => lambda { |obj| obj.full_address_changed? }

  #has_many :topics


  def name
  end


  def full_address
     [address, postalCode, city, country].compact.join(', ')
  end

  #Authenticated method
  def self.authenticated(login, password)
    user = find.where("login ? ", login).first
    return nil if user.nil?
    return user if User.encrypt(pass, user.password_salt) == user.crypted_password
    nil
  end

  #Set crypted password with setting password value
  def password=(pass)
    @password = pass
    if(@password != "" && @password != nil)
      self.password_salt = User.ramdom_string(10) if !self.password_salt?
      self.crypted_password = User.encrypt(@password, self.password_salt)

      #setting user password
      key = EzCrypto::Key.with_password("alpha@_num3r1c", "salted hash")

      #encrypt data
      encrypted= key.encrypt @password
      encryptedPass = encrypted.unpack("H*").to_s
      self.crypted_password = encryptedPass
    end
  end

  protected
  #encryption method
  def self.encrypt(crypted_pass, salt)
    Digest::SHA1.hexidigest(crypted_password+salt)
  end

  def self.ramdom_string(len)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len){ |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end


end
