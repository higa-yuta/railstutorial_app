Rails.application.routes.draw do
  get 'statics_pages/home'
  get 'statics_pages/help'
  root "application#hello"
end
