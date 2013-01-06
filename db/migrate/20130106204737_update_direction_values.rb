class UpdateDirectionValues < ActiveRecord::Migration
  def change
  	Vote.all.each do |vote|
  		if vote.direction == "1" 
  			vote.update_attributes!(:direction => "upvote")
  		else if vote.direction == "-1"
  			vote.update_attributes!(:direction => "downvote")
  		end
  		end
  	end
  end
end
