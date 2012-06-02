class User < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :firstname, :full_address, :lastname, :latitude, :login, :longitude, :picture, :postalCode, :remember_me

  validates :firstname, :lastname, :email, :presence => true
  validates :password, :length => { :minimum => 5 }

  #geocoded_by :full_address
  #after_validation :geocode,
  #     :if => lambda { |obj| obj.full_address_changed? }

  #has_many :topics


  def full_address
     [address, postalCode, city, country].compact.join(', ')
  end

end
