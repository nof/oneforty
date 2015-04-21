class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:home]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_name(params[:name])
  end

  def home
  end
end
