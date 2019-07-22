class Questionnaire < ApplicationRecord
  belongs_to :setter, foreign_key: :setter_id, class_name: 'User'
  has_many :questions
  #has_many :user_answered_questionnaires 
  
  accepts_nested_attributes_for :questions
end
