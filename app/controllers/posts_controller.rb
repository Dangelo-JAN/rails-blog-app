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
end
