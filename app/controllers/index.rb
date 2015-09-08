get '/' do
  # Look in app/views/index.erb
  @handler = ""
  @tweets = ""
  erb :index
end

post '/fetch_tweets' do

	if params[:handler].chars.first != '@'
		@handler = "@" + params[:handler]
	else
		@handler = params[:handler]
	end

	@tweets = []
	$twitter_access.search("from:#{@handler}", result_type: "recent").take(10).collect do |tweet|
		@tweets << tweet.text
	end

	erb :index
end

get '/:handler' do

	if params[:handler].chars.first != '@'
		@handler = "@" + params[:handler]
	else
		@handler = params[:handler]
	end

	@tweets = []
	$twitter_access.search("from:#{@handler}", result_type: "recent").take(10).collect do |tweet|
		@tweets << tweet.text
	end

	erb :index
end