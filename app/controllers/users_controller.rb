class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.try(:id))
  end

  def show
    @user = User.find_by(name: params[:name])
  end
end
