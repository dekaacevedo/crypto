Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :crypto_coins, only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
