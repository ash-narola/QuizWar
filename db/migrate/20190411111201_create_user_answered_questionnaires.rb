class CreateUserAnsweredQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :user_answered_questionnaires do |t|
      t.references :user, foreign_key: true
      t.references :questionnaire, foreign_key: true

      t.timestamps
    end
  end
end
