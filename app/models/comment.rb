class Comment < ActiveRecord::Base
	attr_accessible :content, :post_id, :user_id

	belongs_to :post
	belongs_to :user

	validates :content, presence: true
	validates :content, length: { minimum: 5 }
end