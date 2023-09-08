class GeneralShoppingListsController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @user_foods_ids = @user.foods.pluck(:id)
    @recipe_foods_ids = @recipe.recipe_foods.pluck(:food_id)
    @missing_foods = @recipe_foods_ids - @user_foods_ids
    @missing_food_records = Food.where(id: @missing_foods)
    @recipe_foods = @recipe.recipe_foods

    @food_prices = {}
    @sum = 0
    @missing_food_records.each do |food|
      recipe_food = @recipe.recipe_foods.find_by(food_id: food.id)
      if recipe_food
        @food_prices[food.id] = food.price * recipe_food.quantity.to_i
        @sum += @food_prices[food.id]
      else
        @food_prices[food.id] = 0
      end
    end

  end
end
