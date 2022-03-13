Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'articles#index'

  # #Articles
  # get "/articles", to: "articles#index"

  # #Articles Show

  # get "/articles/:id", to: "articles#show"
  resources :articles do
    resources :comments
  end
end
