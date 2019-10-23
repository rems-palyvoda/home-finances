# frozen_sring_literal: true

Rails.application.routes.draw do
  resources :transactions

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
