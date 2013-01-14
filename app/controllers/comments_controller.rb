class CommentsController < ApplicationController
	before_filter :require_user, only: [:new, :create, :edit, :update, :destroy]
	
	def create
		@post = Post.find_by_slug(params[:post_id])
		@comment = @post.comments.create(params[:comment])

		respond_to do |f|
			if @comment.save
				f.html { redirect_to post_path(@post), :notice => 'Boom left comment' }
			else
				f.html { redirect_to post_path(@post), :alert => 'Comment must be at least 5 characters.' }
			end
		end
	end
end