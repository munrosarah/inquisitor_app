class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :user_id
  
  belongs_to :user, class_name: "User"
  belongs_to :question, class_name: "Question"
  
  validates :content, presence: true
  validates :user_id, presence: true
  
end
