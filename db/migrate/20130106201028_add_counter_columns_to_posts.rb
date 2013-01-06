class AddCounterColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :upvote_counter, :integer
    add_column :posts, :downvote_counter, :integer

    Post.all.each do |post|
    	post.update_attributes!(:upvote_counter => post.votes.count(:conditions => ["direction = 1"]))
    	post.update_attributes!(:downvote_counter => post.votes.count(:conditions => ["direction = -1"]))
    end
  end
end
