class UsersController < ApplicationController
  before_action :set_user, only: [:followers, :followees]

  def index
    @users = User.where.not(id: current_user.try(:id)).page params[:page]
  end

  def show
    @user = User.find_by(name: params[:name])
    @tweets = @user.tweets.page params[:page]
  end

  def followers
    @users = @user.followers.page params[:page]
    render 'index'
  end

  def followees
    @users = @user.followees.page params[:page]
    render 'index'
  end

  private
    def set_user
      @user = User.find_by(name: params[:name])
    end
end
