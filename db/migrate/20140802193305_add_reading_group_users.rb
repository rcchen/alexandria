class AddReadingGroupUsers < ActiveRecord::Migration
  def change
  	create_table :reading_groups_users, id: false do |t|
      t.integer :reading_group_id
      t.integer :user_id
  	end
  end
end
