class Post < ActiveRecord::Base
  attr_accessible :content, :user_id
  
  belongs_to :user
  
  validates :content, :length => {:maximum => 140}  #on twitter length of posts content is limited on 140 caracters
  
end
