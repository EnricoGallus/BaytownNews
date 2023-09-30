# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :editions
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  end

  # Defines the root path route ("/")
  root 'home#index'
end
