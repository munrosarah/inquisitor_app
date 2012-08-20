# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  has_many :answers, foreign_key: "question_id", dependent: :destroy
  
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
    
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
    # Return whether this question has been answered by a given user
  def answered?(question)
    Answer.find_by_user_id_and_question_id(self.id, question.id)
  end
  
  # Return the current user's answer to this question
  def answer(question)
    @answer = Answer.find_by_user_id_and_question_id(self.id, question.id)
    @answer.content
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
