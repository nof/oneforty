class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_tweet, only: [:create, :destroy]

  def index
    @favorite_tweets = User.find_by(name: params[:user_name]).favorite_tweets
  end

  def create
    @tweet.favorites.create(user_id: current_user.id)
  end

  def destroy
    @tweet.favorites.find_by(user_id: current_user.id).destroy
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end
end
