Rails.application.routes.draw do
  resources :users, param: :name, only: [:index, :show] do
    resources :likes, only: [:index]
    resources :followers, only: [:index]
    resources :followees, only: [:index]
    member do
      get 'timeline'
    end
  end

  root 'users#timeline'

  devise_for :users, path: 'auth'
end
