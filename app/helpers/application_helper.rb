module ApplicationHelper
	def title(page_title)
		content_for :title do page_title + " - Speed Value" end
	end
end
