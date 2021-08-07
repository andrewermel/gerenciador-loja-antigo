Rails.application.routes.draw do
  resources :transactions
  resources :inventories
  resources :products
  resources :product_types
  resources :users
  get 'transactions/buy' => 'transactions#buy'
  get 'transactions/sell' => 'transactions#sell'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
