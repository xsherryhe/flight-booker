Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :flights, only: [:index]
  resources :bookings, only: %i[new create]
  # Defines the root path route ("/")
  # root "articles#index"
  root 'flights#index'
end
