Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resources :books, only: [:index, :create, :update, :show, :destroy] do
    member do
      get  :reviews
      post :review
      post :recommend
    end
    collection do
      post :query
    end
  end

  resources :users, only: [:index, :show] do
    member do
      post :friend
      post :unfriend
    end
    collection do
      get :friends
    end
  end

  get '/recommendations' => 'books#recommendations'

  root to: "books#index"
end
