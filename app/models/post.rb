class Post < ActiveRecord::Base
  attr_accessible :content, :user_id
  
  belongs_to :user
  
  validates :content, :length => {:maximum => 140}  #on twitter length of posts content is limited on 140 caracters
  
  def view_post
    content 
  end
  
  def show_username
    "@"+ login
  end
  
  def time_count
    created_at.strftime("%d-%m-%Y %H:%M") 
  end
  
end
