Rails.application.routes.draw do


  get 'communities/new' => 'communities#new'
  post 'communities/create' => 'communities#create_community'
  get 'communities/show/:comm_id' => 'communities#show'
  get 'communities/edit/:id' => 'communities#edit'
  post 'communities/update/:id' => 'communities#update'
  post 'communities/delete/:id' => 'communities#delete'

  get 'posts/create'
  get 'posts/miniblog' => 'posts#mini_create'
  get 'posts/show/:id' => 'posts#show'
  get 'posts/edit/:id' => 'posts#edit'
  post 'posts/update/:id' => 'posts#update'
  post 'posts/delete/:id' => 'posts#delete'

  get '/searches' => 'searches#search'

  get 'users/show'
  get 'users/:user_name/:comm_name' => 'users#comms'
  get 'joinings/create' => 'joinings#create'
  #get 'home/index'
  devise_for :users, controllers: {
    sessions:   'users/sessions',
    passwords:  'users/passwords',
    registrations:  'users/registrations'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :users, only: [:show]
  resources :posts, only: [:create]
  resources :communities
  resources :joinings
end
