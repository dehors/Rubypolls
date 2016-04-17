class Question < ActiveRecord::Base
  belongs_to :my_poll
  has_many :answers
  validates :description, presence: true, length: {  minimum: 10 , message: "%{value} You must have minimum 10 characters"}
  validates :my_poll, presence: true
end
