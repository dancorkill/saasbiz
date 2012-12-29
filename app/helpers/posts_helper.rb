module PostsHelper
	def post_url(post)
		if post.url.starts_with?("http://" || "https://")
			return post.url
		else
			return "http://" + post.url
		end
	end
end