class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
    @post = Post.find(params[:id])
  end

  # def show
  #   @post = Post.find(params[:id])
  #   @user = @post.author
  #   @comments = @post.comments
  # end
end
