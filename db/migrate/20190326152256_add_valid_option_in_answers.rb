class AddValidOptionInAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :valid_option, :boolean, default: false
  end
end
