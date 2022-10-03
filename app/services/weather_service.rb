class WeatherService < ApplicationController
  def initialize(city)
    @weather_url = Rails.application.config.weather
    @city = I18n.transliterate(city.gsub(" ", "%20"))
  end

  def call
    response = Faraday.get("#{@weather_url['base_path']}/#{@weather_url['complement_path']}?city=#{@city}")
    JSON.parse(response.body)
  end
end
