Rails.application.routes.draw do
  
  root to: 'pages#index'
  resources :articles
  resources :users
  
  get '/contact',     to: 'pages#contact'
  get '/about',  to: 'pages#about'
  
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
