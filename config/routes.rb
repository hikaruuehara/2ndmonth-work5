Rails.application.routes.draw do
  get 'search/search'
  get 'home/about' => 'homes#about', as: 'about'
  root 'homes#top'
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  post 'folow/:id' => 'relationships#create', as: 'follow'
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
  get 'follows/:id' => 'relationships#follows', as: 'follows'
  get 'followers/:id' => 'relationships#followers', as: 'followers'
  resources :users, only: [:show,:index,:edit,:update]

  get '/search' => 'search#search'
end
