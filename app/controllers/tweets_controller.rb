class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      render 'home/timeline'
    else
      flash[:alert] = @tweet.errors.full_messages.join(', ')
      render text: 'location.reload();'
    end
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
  end

  def search
    @tweets = Tweet.search(body_cont: params[:q]).result.page params[:page]
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body, :user_id)
    end
end
