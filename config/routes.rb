Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'topics/new'
   get 'sessions/new'
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'
  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  # resources :users
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  
  resources :images do
    resources :comments, only: [:create, :destroy]
  end
  
end
