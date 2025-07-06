Rails.application.routes.draw do
  root "wishes#index"
  resources :wishes, only: [:create]
end
