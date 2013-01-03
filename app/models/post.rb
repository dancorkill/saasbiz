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

	before_create :create_slug

	def votes_score
		votes.count(:conditions => ["direction = 1"]) - votes.count(:conditions => ["direction = -1"])
	end

	def to_param
		slug
	end

	def create_slug
		self.slug = self.title.parameterize
	end

	def shares(url)
		returnedhash = HTTParty.get('http://graph.facebook.com/?id=' + url)
		return returnedhash['shares']
	end

end







