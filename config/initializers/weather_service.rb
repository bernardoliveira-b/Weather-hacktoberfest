Rails.application.config.after_initialize do
  Rails.application.config.weather = Rails.application.config_for(:weather)
end
