Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :users, only: [:create]
      #busca el controlador users_controller
      resources :polls, controller: "my_polls", except: [:new, :edit]
      #se le asigna el controlador my_polls
      resources :questions, except: [:new, :edit]
    end
    namespace :v2 do
      resources :users
    end
  end
end
