Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movie_groups do
    resources :reviews
    member do
      post :favorite
      post :unfavorite
    end
  end
  namespace :account do
    resources :movie_groups
    resources :reviews
  end

  root 'movie_groups#index'
end
