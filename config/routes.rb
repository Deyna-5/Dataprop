Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :properties, except: [:index, :show]

  root "home#index"
end
