class UsersController < ApplicationController

	def login
		session[:user_id] = User.find_by_username('roger').id
		redirect_to root_path
	end

	def logout
		reset_session
		redirect_to root_path
	end

end
