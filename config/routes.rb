Rails.application.routes.draw do
  resources :users, param: :name, only: [:index] do
    resources :tweets, only: [:index]
    resources :likes, only: [:index]
    resources :followers, only: [:index]
    resources :followees, only: [:index]
    member do
      get 'timeline'
    end
  end

  root 'users#timeline'

  devise_for :users
end
