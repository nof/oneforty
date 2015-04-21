Rails.application.routes.draw do
  resources :users, param: :name, only: [:index, :show] do
    resources :likes, only: [:index]
    resources :followers, only: [:index]
    resources :followees, only: [:index]
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
