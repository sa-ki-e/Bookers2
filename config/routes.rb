Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/index'
  # get 'users/edit'
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  root to: "homes#top"
  devise_for :users

  resources :users, only: [:show, :index, :edit, :update]#update?

  resources :books

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/homes/about" => "homes#about", as: "about"
end
