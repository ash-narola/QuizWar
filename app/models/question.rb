class Question < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers
  
  accepts_nested_attributes_for :answers
  
  def valid_answer
    answers.find_by(valid_option: true)
  end
end
