# A very simple question class, with content only
# Next version: type attribute, with optional choices attribute
class Question < ActiveRecord::Base
  attr_accessible :content
  
  has_many :answers, dependent: :destroy
  
  validates :content, presence: true
  
  
end
