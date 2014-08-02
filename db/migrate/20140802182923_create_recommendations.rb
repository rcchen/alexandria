class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :book_id
      t.integer :reading_group_id
      t.integer :user_id
      t.boolean :recommended
      t.text :review
      t.timestamps
    end
  end
end
