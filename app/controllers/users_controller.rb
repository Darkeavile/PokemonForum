class UsersController < ApplicationController
	
  before_action :authenticate_user!, except: [:index, :show]
  def show
  	redirect_to profile_path(current_user.profile_id)
  end

  def index
  	@profiles = Profile.all.order("name ASC")
  end
end
