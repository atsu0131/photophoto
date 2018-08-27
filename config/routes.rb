Rails.application.routes.draw do
  root to:'sessions#new'
  get 'sessions/new'

  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:index,:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
