class CityService < ApplicationController
  def initialize(state)
    @ibge_url = Rails.application.config.ibge
    @state = state
  end

  def call
    response = Faraday.get("#{@ibge_url['base_path']}/#{@ibge_url['actions'][:states]}/#{@state}/#{@ibge_url['actions'][:districts]}?orderBy=nome")
    JSON.parse(response.body)
  end
end
