class RecommendationsController < ApplicationController

	def new
		@book = Book.find_by_id(params[:book])
	end

end
