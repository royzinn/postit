class PostsController < ApplicationController
  before_filter :require_login, only: :new

  def index
    @posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  	@comments = @post.comments
  	@comment = Comment.new
  end

  def create
  	@post = Post.new(params[:post])
  	@post.user = User.first

  	if @post.save
  		flash[:notice] = "Successfully created new post"
  		redirect_to root_url
  	else
  		render :new
  	end
  end
end
