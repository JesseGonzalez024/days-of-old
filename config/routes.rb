Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :posts, only: [:index, :new, :create, :show, :destroy]
  
  get '/signup', to: 'users#new'
  
  get '/', to: 'application#welcome'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'


  delete '/logout', to: 'sessions#destroy'
end
