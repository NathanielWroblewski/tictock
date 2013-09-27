class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def fetch_time_for_city(city)
    latlong = geocode_city(city)
    time_in_timezone(latlong)
  end

  def geocode_city(city)
    Geocoder.configure(timeout: 300)
    Geocoder.coordinates(city)
  end

  def time_in_timezone(latlong)
    Timezone::Zone.new(latlon: latlong)
  end
end
