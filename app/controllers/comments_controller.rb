class CommentsController < ApplicationController

	before_filter :require_login

	def new
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
    	@comment = @post.comments.build(params[:comment])
	  	@comment.user = current_user

	  	@comments = @post.comments

	  	if @comment.save
	  		flash[:notice] = "Successfully added comment"
	  		redirect_to post_path(@post)
	  	else
	  		render 'posts/show'
	  	end
	end
end