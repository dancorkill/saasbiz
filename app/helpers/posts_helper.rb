module PostsHelper
	def post_url(post)
		if post.url.starts_with?("http://" || "https://")
			return post.url
		else
			return "http://" + post.url
		end
	end

	def post_url_no_http(post)
		if post.url.starts_with?("http://" || "https://" || "www.")
			return post.url.sub("http://","")
		else
			return post.url
		end
	end

	def post_url_with_http(url)
		if url.starts_with?("http://" || "https://")
			return url
		else
			return url.insert 0, "http://"
		end
	end

end