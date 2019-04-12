class UserQuestionnaireAnswer < ApplicationRecord
  belongs_to :user_answered_questionnaire
  belongs_to :question
  belongs_to :answer
end
