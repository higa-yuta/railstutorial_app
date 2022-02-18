Rails.application.routes.draw do

  root 'statics_pages#home'

  get '/home', to: 'statics_pages#home'
  get '/help', to: 'statics_pages#help'

end