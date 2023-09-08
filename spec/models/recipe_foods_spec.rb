require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  user = User.new(name: 'yashodhi')
  food = Food.new(
    user:,
    name: 'Test Food',
    measurement_unit: 'Gram',
    price: 9.99,
    quantity: 10
  )
  recipe = Recipe.new(user: @user,
                      name: 'Pasta',
                      description: 'Delicious pasta',
                      preparation_time: 30,
                      cooking_time: 50)

  recipe_food = RecipeFood.new(recipe:, food:, quantity: 2)

  describe 'validations' do
    it 'is valid with a quantity' do
      expect(recipe_food).to be_valid
    end

    it 'is not valid without a quantity' do
      recipe_food.quantity = nil
      expect(recipe_food).not_to be_valid
    end
  end
end
