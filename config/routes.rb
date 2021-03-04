Rails.application.routes.draw do
  resources :vehicles
  resources :parts
  root 'cars#index'
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  
  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
