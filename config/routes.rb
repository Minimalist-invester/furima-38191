Rails.application.routes.draw do

  devise_for :users
  resources :items

  #resources :items

  root to: 'items#index'

  resources :items do
    resources :orders, only: [:index, :create]
  end
end
