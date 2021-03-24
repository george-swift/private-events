Rails.application.routes.draw do
  root 'users#new'
  get 'users/new'
  post 'users/new', to: 'users#create'
  get 'users/show'
  get 'sessions/new'
  post 'sessions/new', to: 'sessions#create'

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
