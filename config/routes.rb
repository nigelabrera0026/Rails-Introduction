Rails.application.routes.draw do
  get 'fave_dishes/show'

  root 'pages#index'
  get 'pages/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :fave_dishes, only: [:show]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  
  get '/fave_dishes/:id', to: 'fave_dishes#show', as: 'fave_dishes'

  get 'about', to: 'pages#about'
  # Defines the root path route ("/")
  # root "posts#index"
end
