Rails.application.routes.draw do
  namespace :api do
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    get "/shows" => "shows#read"

    get "/shows/:text" => "shows#season" 
  end
end
