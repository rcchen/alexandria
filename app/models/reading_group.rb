class ReadingGroup < ActiveRecord::Base

	has_and_belongs_to_many :users
	has_many :recommendations
	has_many :discussions

	before_validation :assign_invite_code

	def assign_invite_code
		begin
			self.invite_code = (0...6).map { (65 + rand(26)).chr }.join
		end while not ReadingGroup.find_by_invite_code(self.invite_code).nil?
	end

end
