module ApplicationHelper
	def avatar_url(user)
		if user.image
			return user.image
		else
			gravatar_id = Digest::MD5::hexdigest(user.email).downcase 
			"https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identicon&s=50"
		end
	end 

end
