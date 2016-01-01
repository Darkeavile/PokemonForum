class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
	def index
		@groups = Group.all.order("name ASC")
	end

	def show
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.create(group_params)
		if @group.save
			current_user.add_group(@group, "member")
			@group.members = 1
			redirect_to group_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		@group = Group.update(group_params)
		if @group.save
			redirect_to group_path
		else
			render 'edit'
		end
	end

	def destroy
		@group.destroy
		redirect_to groups_path
	end

	private

	def group_params
      params.require(:group).permit(:name)
    end

    def find_group
      @group = Group.find(params[:id])
    end

end
