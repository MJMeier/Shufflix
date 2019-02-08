Rails.application.routes.draw do
  namespace :api do
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    get "/shows" => "shows#read"

    get "/searches" => "searches#search" 

    get "/episodes" => "episodes#random"
  end
end
