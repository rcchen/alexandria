class DiscussionsController < ApplicationController

	def new
		@book = Book.find_by_id(params[:book])
		@image = GoogleBooks.search(@book.title).first.image_link(:zoom => 2)
		user_groups = @current_user.reading_groups.all
		@groups = Array.new
		user_groups.each do |user_group|
			@groups << [user_group.name, user_group.id]
		end
		@discussion = Discussion.new
	end

	def create

	end

end
