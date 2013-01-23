module UsersHelper
	def bigurl 
		normalurl = Twitter.user_timeline(@user.username).first.profile_image_url 
	    normalurl.sub('_normal', '_bigger') 
	end
end