class User < ActiveRecord::Base

	has_and_belongs_to_many :reading_groups
	has_many :recommendations

end
