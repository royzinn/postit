class CategoriesController < ApplicationController

	def new
		@category = Category.new		
	end

	def create
    @category = Category.new(params[:category])

    if @category.save
      flash[:notice] = "Successfully created new category"
      redirect_to root_url
    else
     render :new
    end
  end

  def update
    @category = Post.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to :action => 'show', :id => @category
    else
      render :edit
    end
  end
end
