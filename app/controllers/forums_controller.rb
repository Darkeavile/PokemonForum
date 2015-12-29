class ForumsController < ApplicationController
  before_action :find_category
  before_action :find_forum, only: [:show, :edit, :update, :destroy]

  def show
  	@topics = @forum.topic.all.order("created_at DESC")
  end

  def new
  	@forum = Forum.new
  end
  
  def create
  	@forum = @category.forum.create(forum_params)
  	if @forum.save
  		redirect_to categories_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @forum.update(forum_params)
  		redirect_to categories_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@forum.destroy
  	redirect_to categories_path
  end
	private
		def forum_params
			params.require(:forum).permit(:title)
		end

		def find_category
			@category = Category.find(params[:category_id])
		end

		def find_forum
			@forum = @category.forum.find(params[:id])
		end
end