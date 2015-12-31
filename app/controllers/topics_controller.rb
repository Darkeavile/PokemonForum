class TopicsController < ApplicationController

  before_action :find_forum
  before_action :find_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def show
    @replies = @topic.replies.all.order("created_at DESC")
  end

  def new
    @topic = current_user.topics.build
  end
  
  def create
    @topic = current_user.topics.build(topic_params)
    @topic.forum_id = @forum.id;
    if @topic.save
      current_user.profile.totalposts++
      current_user.profile.lastpost = @topic.id
      redirect_to category_forum_topic_path(@forum.category, @forum, @topic)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to category_forum_topic_path(@forum.category, @forum, @topic)
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to category_forum_path(@forum.category, @forum)
  end
  private
    def topic_params
      params.require(:topic).permit(:subject,:content)
    end

    def find_forum
      @forum = Forum.find(params[:forum_id])
    end

    def find_topic
      @topic = @forum.topics.find(params[:id])
    end
end
