Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  resources :users, only: [:show,:edit,:update,:destroy]
  resources :books
  resources :book_comments, only: [:create,:destroy]

  post "favorites/:book_id/create" => "favorites#create"
  post "favorites/:book_id/destroy" => "favorites#destroy"
  root "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
