class Relation < ActiveRecord::Base
  attr_accessible :followed_id  #, :follower_id
  
  #This model traduce the relationship from one user to another: we take about follower and followed users

  has_many :followed_users, :through => :relations, :source => :followed
  
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
  validates :follower_id, presence: true
  validates :followed_id, presence: true

end
