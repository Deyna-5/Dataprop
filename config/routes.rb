Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :properties, except: [:index, :show]

  get "explore", to: "home#explore", as: "explore"

  root "home#index"
end
