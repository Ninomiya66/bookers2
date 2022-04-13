Rails.application.routes.draw do
  get 'books/show'
  get 'books/edit'
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users
  
  resources :books, only: [:show, :edit]

  root to: 'homes#top'
  
  get "/homes/about" => "homes#about", as: "about"

end
