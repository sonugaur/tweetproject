class Tweet < ApplicationRecord
  def self.get_latest_cricket_tweets
    #create a Twitter Search object
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'QXjbeay9bh5xy1O710zJqV51i'
      config.consumer_secret = 'c2Proby2Ydctqw629hv8fO8hjUnpLSHFhyivxECjAirXwN9ehU'
      config.access_token = '2911021353-kaRkA5MflRqpAgq6O5ToWyBaFa7sbR4ZCh38IVW'
      config.access_token_secret = '0bCxw0jQr4rCo6RbFJCEQS8dtD7kDWN8kUemYAwiSr2xA'
    end
    client.search("cricket", result_type: "recent").take(100).collect do |tweetii|
      p "-----------#{tweetii.user.screen_name}: #{tweetii.text} :#{tweetii.created_at}  : #{tweetii.user.profile_image_url} : #{tweetii.user.id}------" 
      unless Tweet.exists?(['tweet_time = ? AND user_id = ?', "#{tweetii.created_at}", "#{tweetii.user.id}"])
        Tweet.create!(screen_name: "#{tweetii.user.screen_name}", tweet_content: "#{tweetii.text}", tweet_time: "#{tweetii.created_at}", profile_image: "#{tweetii.user.profile_image_url}", user_id: "#{tweetii.user.id}", tweet_id: "#{tweetii.id}")
      end
    end
  end

  def self.search(search)
    if search
      Tweet.where("tweet_content LIKE ?", "%#{search}%").order("created_at DESC")
    else
      Tweet.all.order("created_at DESC")
    end
  end
end
