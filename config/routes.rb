Rails.application.routes.draw do
 root "books#top"
  resources :books, except: [:new]
end
