module ApplicationHelper
  def calculate_total_price(recipe)
    total_price = 0.0

    recipe.recipe_foods.each do |recipe_food|
      total_price += recipe_food.food.price.to_f
    end

    total_price
  end
end
