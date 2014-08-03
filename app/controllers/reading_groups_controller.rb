class ReadingGroupsController < ApplicationController

	def index
		if @current_user.nil?
			redirect_to '/login'
		else
			@reading_groups = @current_user.reading_groups
		end
	end

	def new
		@reading_group = ReadingGroup.new
	end

	def create
		reading_group = ReadingGroup.create(reading_group_params)
		reading_group.users << @current_user
		redirect_to controller: "reading_groups", action: "view", id: reading_group
	end

	def join
		reading_group = ReadingGroup.find_by_invite_code(params[:code])
		if reading_group.nil?
			flash[:danger] = "This invite code is invalid."
			redirect_to controller: "reading_groups", action: "new"
		else
			if reading_group.users.include?(@current_user)
				flash[:info] = "You are already part of this group."
			else
				reading_group.users << @current_user
				flash[:success] = "Successfully joined the group!"
			end
			redirect_to controller: "reading_groups", action: "view", id: reading_group
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

	private

	def reading_group_params
		params.require(:reading_group).permit(:name, :description)
	end

end
