class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |table|
      table.string :name, :description
      table.references :user

      table.timestamps
  end
end
