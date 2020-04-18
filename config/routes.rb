Rails.application.routes.draw do
  root "welcome#index"
  resources :users, except: [:index]
  get "/login", to: "users#login"
  delete "/login", to: "users#logout"
end
