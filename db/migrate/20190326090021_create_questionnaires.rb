class CreateQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.string :name
      t.references :setter, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
