class PlacesController < ApplicationController

  def index
  end

  def create
    Geocoder.configure(timeout: 300)
    latlong = Geocoder.coordinates(params[:place])
    timezone = Timezone::Zone.new(latlon: latlong)

    render json: { time: timezone.time(Time.now) }
  end

end
