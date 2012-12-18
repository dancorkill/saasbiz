class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
		redirect_to post_path(@post), :notice => 'Boom left comment'
	end
end