Rails.application.config.after_initialize do
  Rails.application.config.ibge = Rails.application.config_for(:ibge)
end
