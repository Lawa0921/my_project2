Rails.application.routes.draw do
  root "welcome#index"
  resources :users, except: [:index, :destroy, :show, :edit, :update]
  resource :user, only: [:show, :destroy, :edit, :update]
  get "/login", to: "users#login"
  post "/login", to: "users#login_action"
  delete "/login", to: "users#logout"

  resources :works
end
