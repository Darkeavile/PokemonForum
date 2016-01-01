class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_groups
	def index
		@groups = Group.all.order("name ASC")
	end

	def show
		@groupusers = @group.users.all.order("created_at DESC")
	end

	def new
		@group = Group.new
	end

	def create
		@groups = Group.all
		@group = Group.create(group_params)
		if not @groups.include?(@group.name)
			if @group.save
				current_user.add_group(@group, "member")
				@group.members = 1
				redirect_to group_path(params[:id])
			else
				render 'new'
			end
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
    def check_groups
    	#checks to be sure the Member, Admin, and Moderator groups exist
    	if not Group.where( :name => "Administrators").exists?
    		@admin = Group.create(:name => "Administrators")
    		if not @admin.save
    			redirect_to categories_path
    		end		
    	end
    	if not Group.where( :name => "Members").exists?
    		@members = Group.create(:name => "Members")
			if not @members.save
    			redirect_to categories_path
    		end		
    	end
    	if not Group.where( :name => "Moderators").exists?
    		@mod = Group.create(:name => "Moderators")
    		if not @mod.save
    			redirect_to categories_path
    		end		
    	end
    end
end
