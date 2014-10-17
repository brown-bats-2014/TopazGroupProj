class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :survey
      t.references :question
      t.references :choice
      t.references :user

      t.timestamps
    end
  end
end
