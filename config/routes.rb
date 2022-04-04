Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#new'

  # #Articles
  # get "/articles", to: "articles#index"

  # #Articles Show

  # get "/articles/:id", to: "articles#show"
  resources :articles do
    resources :comments
  end

  get '/register', to: 'users#new'
  resources :users, only: [:create]

  # Sessions

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
end
