class Post < ActiveRecord::Base
	attr_accessible :title, :url

	validates :title, presence: true
	validates :title, length: { minimum: 2 }
	validates :url, presence: true

	#ensures url has http or https included
	#validates_format_of :url, :with =>
	#URI::regexp(%w(http https))

	has_many :comments
	has_many :votes


	def votes_score
		return 5
	end

end







