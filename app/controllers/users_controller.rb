class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:timeline]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_name(params[:name])
  end

  def timeline
  end
end
