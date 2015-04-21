Rails.application.routes.draw do
  resources :users, param: :name, only: [:index, :show] do
    resources :tweets, only: [:index]
    resources :likes, only: [:index]
    resources :followers, only: [:index]
    resources :followees, only: [:index]
    member do
      get 'home'
    end
  end
  resources :tweets, only: [:show, :create, :destroy] do
    collection do
      get 'search'
    end
  end
  root 'users#home'
  devise_for :users, path: 'auth'
end
