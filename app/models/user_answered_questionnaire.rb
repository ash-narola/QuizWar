class UserAnsweredQuestionnaire < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire
  has_many :user_questionnaire_answers
  
  accepts_nested_attributes_for :user_questionnaire_answers
end
