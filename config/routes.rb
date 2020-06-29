Rails.application.routes.draw do
  root to: "pics#index"

  resources :pics

end
