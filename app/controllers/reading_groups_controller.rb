class ReadingGroupsController < ApplicationController

	def index
		@reading_groups = ReadingGroup.all
	end

	def view
		@reading_group = ReadingGroup.find_by_id(params[:id])
	end

end
