Rails.application.routes.draw do
  namespace :api, constraint: { format: 'json' } do
    namespace :v1 do
      post 'signup', to: 'sessions#signup', as: :signup
      post 'signin', to: 'sessions#signin', as: :signin
      resources :devices, only: [:create]
    end
  end
end
