class PostsController < ApplicationController
	before_filter :posts_find, only: [:show, :edit, :update, :destroy]
	before_filter :require_user, only: [:new, :create, :edit, :update, :destroy]

	def index
		@posts = Post.all

		respond_to do |format|
			format.html # index.html.erb
			format.json {render json: @posts}
		end
	end

	def show
		@comment = ""

		respond_to do |format|
			format.html # show.html.erb
			format.json {render json: @post}
		end
	end

	def new
		@post = Post.new

		respond_to do |f|
			f.html
			f.json { render json: @post }
		end
	end

	def create
		@user = User.find(session[:user_id])
		@post = @user.posts.new(params[:post])

		respond_to do |f|
			if @post.save
				f.html { redirect_to @post, notice: 'Boom post was created' }
			else
				f.html { render action: "new" }
			end
		end
	end

	def edit
	
	end

	def update
		respond_to do |f|
			if @post.update_attributes(params[:post])
			f.html { redirect_to @post, notice: 'Boom post was edited' }
			else
			end
		end
	end

	def destroy
		respond_to do |f|
			if @post.destroy
				f.html {redirect_to root_path, notice: 'Post was deleted'}
			else
			end
		end
	end

	def posts_find
		@post = Post.find_by_slug(params[:id])
	end


end