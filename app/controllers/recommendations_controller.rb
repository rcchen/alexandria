class RecommendationsController < ApplicationController

	def new
		if (params[:gbook])
			gbook = GoogleBooks.search(params[:gbook]).first
			book = Book.create({
				title: gbook.title,
				author: gbook.authors,
				isbn: gbook.isbn	
			})
			redirect_to action: "new", book: book
		else
			@book = Book.find_by_id(params[:book])
			@image = GoogleBooks.search(@book.title).first.image_link(:zoom => 2)
			user_groups = @current_user.reading_groups.all
			@groups = Array.new
			user_groups.each do |user_group|
				@groups << [user_group.name, user_group.id]
			end
			@recommendation = Recommendation.new
		end
	end

	def create
		recommendation = Recommendation.new(recommendation_params)
		recommendation.user = @current_user
		recommendation.save
		redirect_to controller: "books", action: "view", id: recommendation.book
	end

	private

	def recommendation_params
		params.require(:recommendation).permit(:book_id, :reading_group_id, :recommended, :review)
	end

end
