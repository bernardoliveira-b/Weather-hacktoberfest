class StateService < ApplicationController
  def initialize
    @ibge_url = Rails.application.config.ibge
  end

  def call
    response = Faraday.get("#{@ibge_url['base_path']}/#{@ibge_url['actions'][:states]}?orderBy=nome")
    JSON.parse(response.body)
  end
end
