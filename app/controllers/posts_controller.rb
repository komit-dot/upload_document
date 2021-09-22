class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  @post = Post.new
  if params[:tag]
    @posts = current_user.posts.tagged_with(params[:tag])
  else
    @posts = current_user.posts
  end
end

  def create
  @post = current_user.posts.new(post_params)
  respond_to do |format|
    if @post.save
      format.js # Will search for create.js.erb
    else
      format.html { render root_path }
    end
  end
end
 
  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


  def destroy
    @post.destroy
    redirect_to posts_index_path
  end 

  def share
    post = Post.find_by_id(params[:post_id])
    respond_to do |format|
      if post.update_column('shared', true)
        format.js 
      else
        format.html { render root_path }
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :user_id, :image, :all_tags, :shared)
  end
 
  def set_post
    @post = Post.find_by_id(params[:id])
  end
end