module NavbarHelper
	def city
		case params[:city]
		when "bj"
			"北京"
		when "sh"
			"上海"
		when "sz"
			"深圳"
		when "gz"
			"广州"
		when "hz"
			"杭州"
		else
			"全国"
		end
	end
end