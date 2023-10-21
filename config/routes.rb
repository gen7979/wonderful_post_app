Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :mypage #mypageへのルーティングを追加
  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
