class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def self.format_handler(handler)
  	if handler.chars.first != '@'
			handler = "@" + handler
		else
			handler
		end
	end

	def self.exists?(handler)
		if TwitterUser.find_by_handler(handler) == nil
			false
		else
			true
		end
	end
end