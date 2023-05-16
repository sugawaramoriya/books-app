Rails.application.routes.draw do
  get 'users/login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/signup', to: 'users#input'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'profile'
  delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/books',to: 'books#index'
  get '/books/new',to: 'books#new',as: :new_book
  get '/books/search',to: 'books#search'
  post '/books', to: 'books#create'
  get '/books/:id',to: 'books#show',as: :book
  get 'books/:id/edit', to: 'books#edit', as: :edit_book
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
end
