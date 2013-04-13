class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
    	@comment = @post.comments.build(params[:comment])
	  	@comment.user = User.first

	  	if @comment.save
	  		flash[:notice] = "Successfully added comment"
	  		redirect_to post_path(params[:post_id])
	  	else
	  		render :new
	  	end
	end
end