class WeatherService < ApplicationController
  def initialize
    @weather_url = Rails.application.config.weather
  end

  def call
    response = Faraday.get("#{@weather_url['base_path']}/api/weather/city/?city=Campos%20dos%20Goytacazes")
    JSON.parse(response.body)
  end
end
