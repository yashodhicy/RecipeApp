Rails.application.routes.draw do
  root 'users#index'

  resources :recipes, only: %i[index show]
  resources :foods, only: %i[index show]
  resources :recipe_foods, only: %i[index show]
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
end
