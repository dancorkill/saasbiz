class ChangeColumnDirectionVotes < ActiveRecord::Migration
  def change
  	change_column :votes, :direction, :string

  	Vote.all.each do |vote|
  		if vote.direction == 1 
  			vote.direction = "upvote"
  		else if vote.direction == -1
  			vote.direction = "downvote"
  		end
  		end
  	end
  end
end
