Rails.application.routes.draw do
  root "welcome#index"
  resources :users, except: [:index, :destroy, :show, :edit]
  resource :user, only: [:show, :destroy]
  get "/login", to: "users#login"
  post "/login", to: "users#login_action"
  delete "/login", to: "users#logout"
end
