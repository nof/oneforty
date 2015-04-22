class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:followers, :followees]
  before_action :set_user, only: [:followers, :followees]

  def index
    @users = User.where.not(id: current_user.try(:id))
  end

  def show
    @user = User.find_by(name: params[:name])
  end

  def followers
    @users = @user.followers
    render 'index'
  end

  def followees
    @users = @user.followees
    render 'index'
  end

  private
    def set_user
      @user = User.find_by(name: params[:name])
    end
end
