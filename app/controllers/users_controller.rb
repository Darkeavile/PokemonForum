class UsersController < ApplicationController
	
  before_action :authenticate_user!, except: [:index, :show]
  def show
  end

  def index
  	@users = User.all.order("created_at DESC")
  end


   
end
