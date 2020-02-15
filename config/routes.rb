Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  
  get '/', to: 'application#welcome'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get  '/auth/:provider/callback', to: 'sessions#omniauth'
  
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :posts, only: [:index, :new, :create, :show, :destroy] do 
    resources :comments, only: [:new, :create, :destroy]
  end


  delete '/logout', to: 'sessions#destroy'
end
