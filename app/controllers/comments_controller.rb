class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
    	@comment = @post.comments.build(params[:comment])
	  	@comment.user = User.first

	  	@comments = @post.comments

	  	if @comment.save
	  		flash[:notice] = "Successfully added comment"
	  		redirect_to post_path(@post)
	  	else
	  		render 'posts/show'
	  	end
	end
end