class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :twitter_user

  def self.fetch_recent_tweets(handler)
	  
	  tweets = []	
		$twitter_access.search("from:#{handler}", result_type: "recent").take(10).collect do |tweet|
				tweets << tweet.text
		end
		tweets
	end

	def self.tweets_stale?(handler)
		last_update = handler.tweets.first.updated_at
		duration = Time.now - last_update

		if duration > 900
			true
		else
			false
		end
	end
end
