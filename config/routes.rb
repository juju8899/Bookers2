Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :create, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
