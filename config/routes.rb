Rails.application.routes.draw do
  resources :users
  resources :blogs do
    member do
      resources :comments
    end
  end
  
  root 'blogs#index'
  
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'usesr#create'
  resources :sessions, only: [:new, :create]
  match 'logout' => 'sessions#destroy', as: 'logout', via: [:get, :post]
end
