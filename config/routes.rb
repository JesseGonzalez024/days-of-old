Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  
  get '/', to: 'application#welcome'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :posts, only: [:index, :new, :create, :show, :destroy] do 
    resources :comments, only: [:index, :new, :create, :destroy]
  end


  delete '/logout', to: 'sessions#destroy'
end
