class ReadingGroup < ActiveRecord::Base

	has_and_belongs_to_many :users
	has_many :recommendations
	has_many :discussions

end
