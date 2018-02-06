Rails.application.routes.draw do
  namespace :api, constraint: { format: 'json' } do
    namespace :v1 do
      post 'signup', to: 'sessions#signup', as: :signup
    end
  end
end
