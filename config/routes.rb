Rails.application.routes.draw do
  root 'index#index'
  resources :games
  resources :teams
end
