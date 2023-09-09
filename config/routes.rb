Rails.application.routes.draw do
  devise_for :users

  root 'users#index'


  resources :recipes, only: %i[index show new create destroy] do
    resources :recipe_foods, only: %i[new create destroy]
  end
  resources :foods, only: %i[index new create destroy]
  resources :public_recipes, only: [:index]
  resources :general_shopping_lists, only: [:index]

  resources :recipes do
    member do
      patch :toggle_public
    end
  end
end
