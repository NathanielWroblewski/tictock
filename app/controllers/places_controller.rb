class PlacesController < ApplicationController

  def index
  end

  def show
    city = params[:place]
    time = fetch_time_for_city(city)

    render json: {id: 1, time: time, place: city}
  end
end
