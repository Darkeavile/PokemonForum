class ForumsController < ApplicationController
  before_action :find_category
  before_action :find_forum, only: [:show, :edit, :update, :destroy]

  def show
  	@topics = @forum.topics.all.order("created_at DESC")
  end

  def new
  	@forum = Forum.new
  end
  
  def create
  	@forum = @category.forum.create(forum_params)
  	if @forum.save
  		redirect_to admin_index_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @forum.update(forum_params)
  		redirect_to admin_index_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@forum.destroy
  	redirect_to admin_index_path
  end
	private
		def forum_params
			params.require(:forum).permit(:title)
		end

		def find_category
			@category = Category.find(params[:category_id])
		end

		def find_forum
			@forum = @category.forums.find(params[:id])
		end
end
