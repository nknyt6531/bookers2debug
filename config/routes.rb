Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  get 'user/followers/:id' => 'users#followers', as: 'followers'
  get 'user/followings/:id' => 'users#followings', as: 'followings'
  resources :relationships, only: [:create,:destroy]
  
  resources :books, only: [:show,:index,:create,:edit,:update,:destroy]do
    resources :book_comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end
end
  