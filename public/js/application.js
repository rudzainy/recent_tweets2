$(document).ready(function() {

  var handler = $('#tweets_container').data('handler')
  
  $.ajax({
  	url: '/refresh',
  	method: 'POST',
  	data: { handler: handler } 
  }).done(function(response){
  	$('.spinner').hide();
  	document.getElementById('notice').innerHTML = "10 recent tweets by" + handler + "<br><hr>";

		var tweets = JSON.parse(response)

		tweets.forEach(function(tweet){
			$('#tweet_div').append(tweet.tweet + "<br><hr>")
		})
  	// $.each(tweets, function(tweet){
  	// 	$('#tweet_div').append(tweet.tweet + "<br><hr>")
  	// })
  })
});
