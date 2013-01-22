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

	def show
		@user = User.find_by_username(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json {render json: @user}
		end
	end

end