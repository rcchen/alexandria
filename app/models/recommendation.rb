class Recommendation < ActiveRecord::Base

	belongs_to :user
	belongs_to :book
	belongs_to :reading_group

end
