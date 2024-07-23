Rails.application.routes.draw do
  root 'books#index'
  resources :books, except: [:new]
end
