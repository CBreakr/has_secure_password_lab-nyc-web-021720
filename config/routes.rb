Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get "/users/home" => "users#home"
  get "/users/duplicate" => "users#duplicate"

  resources :users, only: [:new, :create]

end
