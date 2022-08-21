class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @user = @post.author
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user
    if @post.save
      redirect_to user_post_path(params[:user_id], @post)
    else
      @user = User.find(params[:user_id])
      render :new, status: :unprocessable_entity
    end
  end
end
