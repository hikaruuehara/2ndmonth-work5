Rails.application.routes.draw do
  get 'home/about' => 'homes#about', as: 'about'
  root 'homes#top'
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show,:index,:edit,:update]
end
