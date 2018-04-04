class TweetsController < ApplicationController

  def index
       @tweets = Tweet.search(params[:search]).paginate(page: params[:page], per_page: 20)
       respond_to do |format|
         format.html
         format.json
       end
     
  end
	
end
