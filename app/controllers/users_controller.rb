class UsersController < ApplicationController

	def index
		
	end

	def login
		redirect_to root_path
	end

	def logout
		reset_session
		redirect_to root_path
	end

end
