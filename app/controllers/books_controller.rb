class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def view
		@book = Book.find_by_id(params[:id])
		@image = GoogleBooks.search(@book.title).first.image_link(:zoom => 2)
		@recommendations = Recommendation.where({
			book: @book, 
			reading_group: @current_user.reading_groups
		})
		@discussions = Discussion.where({
			book: @book, 
			reading_group: @current_user.reading_groups,
			parent: nil
		}).order(created_at: :desc)
	end

	def update
		book = Book.find_by_id(params[:id])
		result = GoogleBooks.search(book.title).first
		book.author = result.authors
		book.isbn = result.isbn
		book.save
		redirect_to action: 'view'
	end

end
