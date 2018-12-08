Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/destroy'
  get 'users/update'
  get 'searches/search'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  get 'books/create'
  get 'books/update'
  get 'books/destroy'
  devise_for :users
  root "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
