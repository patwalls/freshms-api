FreshmsApi::Application.routes.draw do
  devise_for :users, only: []
  devise_for :user, only: []

  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
  end
end
