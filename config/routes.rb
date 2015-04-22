Rails.application.routes.draw do
  resources :users, param: :name, only: [:index, :show] do
    resource :relationship, only: [:create, :destroy]
    resources :likes, only: [:index]
    member do
      get 'followers'
      get 'followees'
    end
  end
  resources :tweets, only: [:show, :create, :destroy] do
    collection do
      get 'search'
    end
  end
  resource :home, only: [:show]
  root 'home#show'
  devise_for :users, path: 'auth'
end
