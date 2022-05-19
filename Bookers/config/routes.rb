Rails.application.routes.draw do
  root :to => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :homes
  resources :books
  get 'top' => 'homes#top'
  
  get 'books/:id', to: 'books#show', as: 'book'
end
