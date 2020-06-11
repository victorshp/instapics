Rails.application.routes.draw do
  resources :pics

  root to: "pics#index"
end
