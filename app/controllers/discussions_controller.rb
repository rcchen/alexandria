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
		discussion = Discussion.new(discussion_params)
		discussion.user = @current_user
		discussion.save
		redirect_to controller: "books", action: "view", id: discussion.book
	end

	private

	def discussion_params
		params.require(:discussion).permit(:book_id, :reading_group_id, :body)
	end

end
