class ReadingGroupsController < ApplicationController

	def index
		if @current_user.nil?
			redirect_to '/login'
		else
			@reading_groups = @current_user.reading_groups
		end
	end

	def view
		@reading_group = ReadingGroup.find_by_id(params[:id])
		@recommended_books = Array.new
		@reading_group.recommendations.each do |recommendation|
			if not @recommended_books.include?(recommendation.book)
				@recommended_books << recommendation.book
			end
		end
		@discussed_books = Array.new
		@reading_group.discussions.each do |discussion|
			if not @discussed_books.include?(discussion.book)
				@discussed_books << discussion.book
			end
		end
	end

end
