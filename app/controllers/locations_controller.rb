class LocationsController < ApplicationController
  before_action :require_login, only: [:index]

  def index; end

  def new; end

  def create
    location = Location.create(latitude: params[:latitude],
                               longitude: params[:longitude])
    user = User.find(session[:user_id])
    user.locations << location

    # 500 error - missing template locations#create
    # NOTE: is 'render' right though?
    render :new
  end
end