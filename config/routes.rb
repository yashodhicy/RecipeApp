Rails.application.routes.draw do
  devise_for :users

  root 'users#index'


  resources :recipes, only: %i[index show new create destroy]
  resources :foods, only: %i[index new create destroy]
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
end
