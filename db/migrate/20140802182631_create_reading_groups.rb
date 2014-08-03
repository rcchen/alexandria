class CreateReadingGroups < ActiveRecord::Migration
  def change
    create_table :reading_groups do |t|
      t.string :name
      t.text :description
      t.string :invite_code
      t.timestamps
    end
  end
end
