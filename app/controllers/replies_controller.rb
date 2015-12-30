class RepliesController < ApplicationController
  
  before_action :find_topic
  before_action :find_reply, only: [:edit, :update, :destroy]
  
  def create
    @reply = @topic.replies.create(reply_params)
    @reply.user_id = current_user.id
    if @reply.save
      redirect_to category_forum_topic_path(@topic.forum.category, @topic.forum, @topic)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @reply.update(reply_params)
      redirect_to category_forum_topic_path(@topic.forum.category, @topic.forum, @topic)
    else
      render 'edit'
    end
  end

  def destroy
    @reply.destroy
    redirect_to category_forum_topic_path(@topic.forum.category, @topic.forum, @topic)
  end

  private
    def reply_params
      params.require(:reply).permit(:content)
    end

    def find_topic
      @topic = Topic.find(params[:topic_id])
    end

    def find_reply
      @reply = @topic.replies.find(params[:id])
    end
end
