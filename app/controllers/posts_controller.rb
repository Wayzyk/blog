class PostsController < ApplicationController
  before_action :find_post, only: [:show,:edit,:update,:destroy, :upvote, :downvote]
  def index
    @posts = Post.all.order(:cached_votes_up => :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save

    if @post.save
      redirect_to @post
    else
      render 'new'
    end

  end

  def show
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)
    if @post.errors.empty?
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path
  end

  def upvote
    @post.upvote_from current_user
    redirect_to posts_path
  end

  def downvote
    @post.downvote_from current_user
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
