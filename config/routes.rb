Rails.application.routes.draw do
  resources :inventories
  resources :balances
  resources :iventory_products
  resources :products
  resources :product_types
  resources :users
  resources :receita
  resources :estoques
  
  get 'vendas' => 'vendas#index'
  post 'vendas' => 'vendas#create'
  
  get 'compras' => 'compras#index'
  post 'compras' => 'compras#create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
