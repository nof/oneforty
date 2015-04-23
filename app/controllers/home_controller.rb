class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @timeline = current_user.timeline.page params[:page]
  end
end
