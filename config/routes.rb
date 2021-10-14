Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
namespace :api do 
  namespace :v1 do 
    resources :code_snippets, only: [:index, :create, :update]
  end
end 
namespace :api do
  namespace :v1 do
resources :users, only: [:index, :new, :show, :create, :destroy, :home]
  end
end
namespace :api do
  namespace :v1 do 
    resources :techblog, only: [:index]
  end
end

namespace :api do
  namespace :v1 do 
resources :users do 
  resources :code_snippets
end
end
end

root 'api/v1/users#home'

get '/auth/github/callback', to: "api/v1/sessions#github_create"
get "/signup", to: "api/v1/users#new"
get "/login", to: "api/v1/sessions#new"
post "/login", to: "api/v1/sessions#create"
post "/logout", to: "api/v1/sessions#destroy"

end
