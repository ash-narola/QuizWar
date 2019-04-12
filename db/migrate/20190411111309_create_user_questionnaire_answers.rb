class CreateUserQuestionnaireAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_questionnaire_answers do |t|
      t.references :user_answered_questionnaire, foreign_key: true, index: { name: :user_ans_que }
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
