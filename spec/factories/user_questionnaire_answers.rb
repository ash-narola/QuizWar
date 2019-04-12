FactoryBot.define do
  factory :user_questionnaire_answer do
    user_answered_questionnaire { nil }
    question { nil }
    answer { nil }
  end
end
