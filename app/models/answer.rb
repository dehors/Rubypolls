class Answer < ActiveRecord::Base
  belongs_to :question
  validator :description, presence: true
  validator :question, presence: true
end
