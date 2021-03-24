Rails.application.routes.draw do
  get 'events/index'
  get 'events/new'
  get 'events/show'
  root 'events#index'
  get 'users/new'
  post 'users/new', to: 'users#create'
  get 'users/show'
  get 'sessions/new'
  post 'sessions/new', to: 'sessions#create'


  resources :users
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
