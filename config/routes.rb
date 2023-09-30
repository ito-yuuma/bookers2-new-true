Rails.application.routes.draw do

  resources :books, only: [:new, :index, :show, :edit]
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  #resources :users, only: [:show, :edit, :new, :update]
  devise_for :users
  root to: "homes#top"
  get '/home/about' => 'homes#about'
  get '/users/:id' => 'users#new', as: 'user'
  get '/users' => 'users#show'
  get '/users/:id/edit' => 'users#edit', as: 'editer'
  patch '/users/:id/edit' => 'users#update'
  post '/books' => 'books#create'
  post '/books/:id' => 'books#create'
  delete '/books/:id' => 'books#destroy'
  patch '/books/:id' => 'books#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
