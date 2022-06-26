Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => "homes#about", as: 'about'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  delete 'books/:id' => 'books#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books,only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :homes
  resources :users
end
