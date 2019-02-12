Rails.application.routes.draw do
  namespace :api do
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    get "/shows" => "shows#read"

    post "/searches" => "searches#search" 

    post "/episodes" => "episodes#random"
  end
end
