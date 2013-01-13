class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		respond_to do |f|
			if @user.save
				f.html { redirect_to root_path, notice: 'Boom new user' }
			else
				f.html { render action: "new" }
			end
		end
	end

end