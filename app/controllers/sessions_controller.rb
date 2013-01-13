class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.where(username: params[:username]).first
		if user && user.authenticate(params[:password])
			session[:user] = user.username
			redirect_to root_path, notice: "You have logged in"
		else
			flash[:error] = "Could not log you in"
			render 'new'
		end
	end

	def destroy
		session[:user] = nil
		redirect_to root_path, notice: "You have being logged out"
	end

end