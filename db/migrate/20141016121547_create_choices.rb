class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :question_id
      t.string :content

      t.timestamps
    end
  end
end
