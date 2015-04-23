class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

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
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body, :user_id)
    end
end
