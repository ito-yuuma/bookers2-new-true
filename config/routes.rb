Rails.application.routes.draw do

  root to: "homes#top"
  get '/home/about' => 'homes#about'
  resources :books, only: [:index, :show, :edit] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  post '/books' => 'books#create'
  post '/books/:id' => 'books#create'
  delete '/books/:id' => 'books#destroy'
  patch '/books/:id' => 'books#update'
  put '/books/:id' => 'books#update'
  devise_for :users
  resources :users, only: [:show, :edit, :index]

  #get '/users/:id' => 'users#new', as: 'user'
  #get '/users' => 'users#show'
  #get '/users/:id/edit' => 'users#edit', as: 'editer'
  patch '/users/:id/edit' => 'users#update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
