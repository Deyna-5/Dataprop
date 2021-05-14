Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :properties, except: [:index, :show] do
    # post "like", to: "likes#create", as: "property_like"
    # delete "like", to: "likes#destroy", as: "property_likes"
    resources :likes, only: [:destroy, :create]
  end

  get "explore", to: "home#explore", as: "explore"

  root "home#index"
end
