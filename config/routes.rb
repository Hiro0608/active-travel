Rails.application.routes.draw do
  devise_for :admins
  root to: 'items#index'

  resources :users do
  resources :bookings
  end
end
