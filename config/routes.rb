Rails.application.routes.draw do
  #Routes for user login
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  #Routes for create, edit, and delete properties, inside routes for "Like and unlike" function
  resources :properties, except: [:index, :show] do
    resources :likes, only: [:destroy, :create]
  end

  #Route for "Explore view"
  get "explore", to: "home#explore", as: "explore"

  root "home#index"
end
