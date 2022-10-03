class HomeController < ApplicationController
  before_action :weather_response
  before_action :load_states

  def index
  end

  def consult
    # TODO: set cities here to list all cities also, after selecting a state
    # byebug
  end

  private

  def load_states
    @states = StateService.new.call
  end

  def weather_response
    @weather_response = WeatherService.new.call
  end
end
