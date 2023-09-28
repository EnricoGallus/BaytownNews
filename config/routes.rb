# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/:locale' do
    resources :editions
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  end

  # Defines the root path route ("/")
  root 'home#index'
end
