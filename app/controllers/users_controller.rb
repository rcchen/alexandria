class UsersController < ApplicationController

	def index

	end

	def login
		if Rails.env.production?
			redirect_to '/auth/facebook'
		else
			session[:user_id] = params[:u]
			redirect_to root_path
		end
	end

	def logout
		reset_session
		redirect_to root_path
	end

end
