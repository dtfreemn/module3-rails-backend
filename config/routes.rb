Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :delete]
      resources :questions, only: [:index, :create, :destroy, :show] do
        resources :replies, only: [:index, :create, :destroy] do
          resources :likes, only: [:create, :destroy]
        end
      end
    end
  end
end
