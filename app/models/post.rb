class Post < ActiveRecord::Base
	attr_accessible :title, :url

	#ensures url has http or https included
	#validates_format_of :url, :with =>
	#URI::regexp(%w(http https))

	has_many :comments
end

