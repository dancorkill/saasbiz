class VotesController < ApplicationController
	before_filter :require_user, only: [:create]

	def create
		@post = Post.find_by_slug(params[:post_id])
		@vote = @post.votes.create(direction: params[:direction], user_id: params[:user_id])
		redirect_to root_path, :notice => 'Boom voted'
	end

end