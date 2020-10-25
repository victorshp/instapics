Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"

  resources :pics, only: [:index, :show, :new, :create, :destroy] do
    member do
      put "like", to: "pics#upvote"
    end
  end
 
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
