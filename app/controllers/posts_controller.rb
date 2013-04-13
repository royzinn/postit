class PostsController < ApplicationController
  def index
  end

  def new
  	Post.new
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
