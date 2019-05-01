class Question < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy
  #has_many :user_questionnaire_answer
  accepts_nested_attributes_for :answers
  
  def valid_answer
    answers.find_by(valid_option: true)
  end
end
