Rails.application.routes.draw do
  get 'users/login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'profile'
  delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'
  get '/books',to: 'books#index'
  get '/books/new',to: 'books#new',as: :new_book
  post '/books', to: 'books#create'
  get '/books/:id',to: 'books#show',as: :book
  get 'books/:id/edit', to: 'books#edit', as: :edit_book
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
end
