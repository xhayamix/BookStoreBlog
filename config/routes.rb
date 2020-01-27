Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'companeys#show'
  get '/posts/show', to: 'posts#show'
  get '/users/new', to: 'users#new'
  get '/users/login', to: 'users#login'
  post '/users/login2', to: 'users#login2'
  get '/posts/detail/:id', to: 'posts#detail'
  post '/users/add', to: 'users#add'
  get '/users/logout',to: 'users#logout'
  get '/posts/new', to: 'posts#new'
  post '/posts/add', to: 'posts#add'
  post '/comments/add', to: 'comments#add'
  get 'posts/show/:id', to: 'posts#show#:id'
  get 'posts/show', to: 'posts#show'
  get '/companeys/detail/:id', to: 'companeys#detail'
  get '/companeys/new', to: 'companeys#new'
  post '/companeys/add', to:'companeys#add'
end
