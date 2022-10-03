class HomeController < ApplicationController
  before_action :weather_response

  def index
  end

  private

  def weather_response
    @weather_response = WeatherService.new.call
  end
end
