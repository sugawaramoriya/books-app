Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/books',to: 'books#index'
  get '/books/new',to: 'books#new',as: :new_book
  post '/books', to: 'books#create'
  get '/books/:id',to: 'books#show',as: :book
  get 'books/:id/edit', to: 'books#edit', as: :edit_book
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
end
