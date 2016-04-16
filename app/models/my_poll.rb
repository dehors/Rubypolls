class MyPoll < ActiveRecord::Base
  validates :title, presence: true , length: {  minimum: 10 , message: "%{value} You must have minimum 10 characters"}
  validates :description, presence: true, length: {  minimum: 20 , message: "%{value} You must have minimum 20 characters"}
  belongs_to :user

  def is_valid?
  	DateTime.now < self.expires_at
  end

end
