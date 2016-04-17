class MyPoll < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true , length: {  minimum: 10 , message: "%{value} You must have minimum 10 characters"}
  validates :description, presence: true, length: {  minimum: 20 , message: "%{value} You must have minimum 20 characters"}
  validates :user, presence: true
  

  def is_valid?
  	DateTime.now < self.expires_at
  end

end 
