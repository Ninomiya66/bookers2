Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users
  
  resources :books, only: [:index, :create, :show, :edit, :destroy]
  
  resources :users, only: [:index, :show, :edit, :update]

  root to: 'homes#top'
  
  get "/homes/about" => "homes#about", as: "about"
  
  get "users/:id" => "users#show", as: :mypage

end
