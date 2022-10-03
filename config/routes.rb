Rails.application.routes.draw do
  root "home#index"
  get 'home/consult', to: 'home#consult'
end
