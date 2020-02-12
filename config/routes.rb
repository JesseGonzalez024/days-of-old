Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts
  resources :comments
  get '/', to: 'application#welcome'
  get '/login', to: 'sessions#login'
  get '/signup', to: 'sessions#new'
end
