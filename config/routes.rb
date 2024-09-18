Rails.application.routes.draw do
  # Route for user registration
  
  # API routes under additional namespace
  namespace :apis do
    namespace :v1 do
      post 'register', to: 'users#create'
      get 'authenticate', to: 'authentications#show'
    end
  end
end
