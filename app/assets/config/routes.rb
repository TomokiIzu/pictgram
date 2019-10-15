Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/help'

  resources :users
  resouces :coments, only: [:create, :destroy]
end