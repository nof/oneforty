class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      render 'home/timeline'
    else
      # TODO @tweet.errorsをalert
      # Ajax でも Rails の flash メッセージを表示したい！ - Qiita http://qiita.com/quanon86/items/979a0b918cf560c9322e
    end
  end

  def destroy
    current_user.tweets.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body, :user_id)
    end
end
