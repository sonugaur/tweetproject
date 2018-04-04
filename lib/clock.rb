require File.expand_path('../../config/boot', __FILE__)

require File.expand_path('../../config/environment', __FILE__)

require 'clockwork'

include Clockwork

module Clockwork

## Here Student is a domain class, having a method insertRecord to

## insert a record in DB

every(20.seconds, 'Fetching tweets') { Tweet.get_latest_cricket_tweets }

end