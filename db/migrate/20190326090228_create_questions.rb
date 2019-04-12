class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :questionnaire
      t.string :question, unique: true
      t.integer :answer

      t.timestamps
    end
  end
end


