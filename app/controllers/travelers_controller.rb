class TravelersController < ApplicationController

  def index
    @travelers = Traveler.all
  end

  def show
    @traveler = Traveler.find(params[:id])
  end

end
