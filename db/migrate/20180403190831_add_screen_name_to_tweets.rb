class AddScreenNameToTweets < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :screen_name, :string
    add_column :tweets, :tweet_content, :text
    add_column :tweets, :tweet_time, :datetime
    add_column :tweets, :profile_image, :string
    add_column :tweets, :user_id, :string
    add_column :tweets, :tweet_id, :string
  end
end
