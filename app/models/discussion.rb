class Discussion < ActiveRecord::Base

	belongs_to :user
	belongs_to :book
	belongs_to :reading_group
	belongs_to :parent, class_name: 'Discussion'
	has_many :discussions, foreign_key: 'parent_id'

end
