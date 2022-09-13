Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
  resources :images do
    resources :orders, only: [:index, :create]
  end
end
end
