class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update]
  
  before_action :authenticate_user!, except: [:show]
  
  def show
    
  end

  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.create(profile_params)
    @profile.user_id = current_user.id
    @profile.lastpost = 0
    @profile.totalposts = 0
    if @profile.save
      current_user.update_attribute(:profile_id, @profile.id)
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  
  
  private
    def profile_params
        params.require(:profile).permit(:name, :image, :about, :signature)
    end

    def find_profile
      @profile = Profile.find(params[:id])
    end
end
