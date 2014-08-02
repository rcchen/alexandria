class CreateReadingGroups < ActiveRecord::Migration
  def change
    create_table :reading_groups do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
