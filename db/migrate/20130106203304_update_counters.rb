class UpdateCounters < ActiveRecord::Migration
  def change
  	Post.all.each do |post|
    	post.update_attributes!(:upvote_counter => post.votes.count(:conditions => ["direction = 1"]))
    	post.update_attributes!(:downvote_counter => post.votes.count(:conditions => ["direction = -1"]))
    end
   end
end
