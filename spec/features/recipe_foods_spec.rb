require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  include Devise::Test::IntegrationHelpers

  before(:all) do
    RecipeFood.delete_all
    Recipe.delete_all
    Food.delete_all
    User.destroy_all
  end

  before(:each) do
    @user = User.create!(name: 'yashodhi',
                         email: 'yashodhi@mail.com',
                         password: '123456',
                         password_confirmation: '123456',
                         confirmed_at: Time.now)

    @food1 = Food.create(
      user: @user,
      name: 'Test Food 1',
      measurement_unit: 'Gram',
      price: 9.99,
      quantity: 10
    )

    @food2 = Food.create(
      user: @user,
      name: 'Test Food 2',
      measurement_unit: 'Gram',
      price: 9.99,
      quantity: 10
    )

    @recipe = Recipe.create(user: @user,
                            name: 'Chicken Biryani',
                            description: 'Delicious chicken biryani with salad and curd',
                            preparation_time: 30,
                            cooking_time: 60)

    sign_in @user
  end

  scenario 'User creates a new recipe food' do
    visit new_recipe_recipe_food_path(@recipe)

    select @food1.name, from: 'recipe_food[food_id]'
    fill_in 'Quantity', with: 10

    click_button 'Create food'

    expect(page).to have_content(@food1.name)
    expect(page).to have_content(10)
  end
end
