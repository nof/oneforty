Rails.application.routes.draw do
  resources :users, param: :name, constraints: { name: /[^\/]+/ }, only: [:index, :show] do
    resource :relationship, only: [:create, :destroy]
    resources :favorites, only: [:index]
    member do
      get 'followers'
      get 'followees'
    end
  end
  resources :tweets, only: [:create, :destroy] do
    resource :favorite, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resource :home, only: [:show]
  root 'home#show'
  devise_for :users, path: 'auth'
end
