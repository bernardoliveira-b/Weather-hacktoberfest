class HomeController < ApplicationController
  before_action :load_states
  before_action :weather_response

  def index
  end

  def consult
    Rails.cache.fetch("districts_#{params[:state]}", expires_in: 12.hours) do
      CityService.new(params[:state]).call
    end

    if params[:city].present?
      Rails.cache.fetch("city_#{params[:city]}", expires_in: 12.hours) do
        WeatherService.new(params[:city]).call
      end
    end

    redirect_to root_path(state: params[:state], city: params[:city])
  end

  private

  def load_states
    @states = StateService.new.call
  end

  def weather_response
    @weather_response = Rails.cache.read("city_#{params[:city]}")
  end
end
