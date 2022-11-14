class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def index
    @post = Post.all
  end

  def new
    @user = User.find(current_user.id) if user_signed_in?
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id) if user_signed_in?
    @post = Post.create(post_params)
    @post.user_id = @user.id

    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
