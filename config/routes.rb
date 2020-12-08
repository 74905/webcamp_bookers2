Rails.application.routes.draw do
  devise_for :users
root "homes#top"
get "/home/about" =>"homes#about"
resources :books do
 resource :favorites, only: [:create, :destroy]
 resources :book_comments, only: [:create, :destroy]
end
resources :users, only: [:index, :show, :edit, :update] do
    member do
        get :following, :followers
    end
end
resource :relationships, only: [:create, :destroy]
get "searchs" => "searchs"
 get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end