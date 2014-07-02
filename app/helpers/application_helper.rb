module ApplicationHelper

	def flash_class(type)
		case type
		when :alert
			return	"warning"

		when :notice
			return "success"
		else 
			return ""
		end 
	end
end
