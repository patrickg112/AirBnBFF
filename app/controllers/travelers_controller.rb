class TravelersController < ApplicationController

  def index
    @travelers = Traveler.all
  end

  def show
    @traveler = Traveler.find(params[:id])
    @recommend = recommend(@traveler)
  
  end

  def recommendations
    @traveler = Traveler.find(params[:id])
    @recs = @traveler.recommendations
  end

end
