class Post < ActiveRecord::Base
	attr_accessible :title, :url, :upvote_counter, :downvote_counter

	validates :title, presence: true
	validates :title, length: { minimum: 2 }
	validates :url, presence: true

	#ensures url has http or https included
	#validates_format_of :url, :with =>
	#URI::regexp(%w(http https))

	belongs_to :user

	has_many :comments
	has_many :votes

	before_create :create_slug, :set_counters

	default_scope :order => 'updated_at DESC'

	def set_counters
		self.upvote_counter = 0
		self.downvote_counter = 0
	end

	def votes_score
		upvote_counter - downvote_counter
	end

	def to_param
		slug
	end

	def create_slug
		self.slug = self.title.parameterize
	end

	def shares(url)
		#returnedhash = HTTParty.get('http://graph.facebook.com/?id=' + url)
		#return returnedhash['shares']
	end

end







