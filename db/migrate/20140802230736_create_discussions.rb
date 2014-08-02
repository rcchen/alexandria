class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :reading_group_id
      t.integer :parent_id
      t.text :body
      t.timestamps
    end
  end
end
