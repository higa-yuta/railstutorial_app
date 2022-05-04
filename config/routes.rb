Rails.application.routes.draw do
  get 'sessions/new'
  root 'statics_pages#home'

  get '/home', to: 'statics_pages#home'
  get '/help', to: 'statics_pages#help'
  get '/about', to: 'statics_pages#about'
  get '/contact', to: 'statics_pages#contact'

  get '/signup', to: 'users#new'
  resources :users, except: :new

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

end