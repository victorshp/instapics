Rails.application.routes.draw do

  devise_for :users
  root to: "pics#index"

  resources :pics, only: [:index, :show, :new, :create, :destroy] do
    member do
      put "like", to: "pic#upvote"
    end
  end

end
