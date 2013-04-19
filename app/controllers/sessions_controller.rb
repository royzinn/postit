class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.where(username: params[:username]).first

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_path, notice: "Aloha, you're successfully logged in!"
		else
			flash.now.alert = "Ooops, username or password are wrong"
    		render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "You're Logged out, Cheers!"
	end

end