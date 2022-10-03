Rails.application.routes.draw do
  root "home#index"
  post 'home/consult', to: 'home#consult'
end
