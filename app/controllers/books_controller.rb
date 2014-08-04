class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def view
		@book = Book.find_by_id(params[:id])
		@image = GoogleBooks.search(@book.isbn).first.image_link(:zoom => 2)
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

	def search
		
	end

	def find
		internal_results = Array.new
		Book.where("title = ? OR author = ? OR isbn = ?", params[:query], params[:query], params[:query]).limit(8).each do |internal_result|
			result = {
				id: internal_result.id,
				title: internal_result.title,
				authors: internal_result.author,
				cover_img: GoogleBooks.search(internal_result.title + ' ' + internal_result.author).first.image_link
			}
			internal_results << result
		end
		google_results = Array.new
		GoogleBooks.search(params[:query], {:count => 8}).each do |google_result|
			result = {
				title: google_result.title,
				authors: google_result.authors,
				cover_img: google_result.image_link,
				isbn: google_result.isbn
			}
			google_results << result
		end
		render json: {a: params[:a], google: google_results, internal: internal_results}
	end

end
