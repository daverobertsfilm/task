Rails.application.routes.draw do
  resources :services, :categories
  root 'services#index'
  end
