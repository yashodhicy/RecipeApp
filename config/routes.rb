Rails.application.routes.draw do
  devise_for :users

  root 'users#index'

  resources :recipes, only: %i[index show new create destroy]
  resources :foods, only: %i[index show]
  resources :recipe_foods, only: %i[index show]
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
end
