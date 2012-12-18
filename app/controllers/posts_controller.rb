class PostsController < ApplicationController
	def index
		@posts = Post.all

		respond_to do |format|
			format.html # index.html.erb
			format.json {render json: @posts}
		end
	end

	def show
		@post = Post.find(params[:id])
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
		@post = Post.new(params[:post])

		respond_to do |f|
			if @post.save
				f.html { redirect_to @post, notice: 'Boom post was created' }
			else
			end
		end
	end

end