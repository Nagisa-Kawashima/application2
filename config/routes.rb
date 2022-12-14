Rails.application.routes.draw do
  get 'event_notices/new'
  get 'event_notices/sent'
  get 'chats/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "search" => "searches#search"
  devise_for :users
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :post_comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]

  end
  resources :users, only: [:index,:show,:edit,:update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
    get "search_form" => "users#search_form"
    # resource :search_form
  end
  resources :chats, only: [:show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups, except: [:destroy] do
    resource :group_users, only: [:create, :destroy]
    resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#sent"
  end
end



# resources :users, only: [:index,:show,:edit,:update] do
#     resource :relationships, only: [:create, :destroy]
#   	get 'followings' => 'relationships#followings', as: 'followings'
#   	get 'followers' => 'relationships#followers', as: 'followers'
#   end