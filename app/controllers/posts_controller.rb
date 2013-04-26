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

  def edit 
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to :action => 'show', :id => @post
    else
      render :edit
    end
  end

  def create
  	@post = Post.new(params[:post])
  	@post.user = current_user

  	if @post.save
  		flash[:notice] = "Successfully created new post"
  		redirect_to root_url
  	else
  		render :new
  	end
  end
end
