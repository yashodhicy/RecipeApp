require 'rails_helper'

RSpec.describe 'GeneralShoppingLists', type: :system do
  include Devise::Test::IntegrationHelpers

  before(:all) do
    Food.delete_all
    Recipe.delete_all

    @nasir = User.first
    @nasir ||= User.create!(name: 'Nasir',
                            email: 'nasir@gmail.com',
                            password: '123456',
                            password_confirmation: '123456',
                            confirmed_at: Time.now)
    @recipe1 = Recipe.create(user: @nasir,
                             name: 'Chicken biryani',
                             description: 'Delicious Chicken biryani',
                             preparation_time: 10,
                             cooking_time: 75)
    @food1 = Food.create(user: @nasir,
                         name: 'pasta',
                         measurement_unit: 'grams',
                         price: 20.0,
                         quantity: 10)
    @food2 = Food.create(user: @nasir,
                         name: 'Macaroni',
                         measurement_unit: 'units',
                         price: 50.0,
                         quantity: 3)
  end

  before(:each) do
    sign_in @nasir
  end

  it 'displays the total value of food needed' do
    visit general_shopping_lists_path(recipe_id: @recipe1.id)
    expect(page).to have_content('total value of food needed: 0')
  end

  it 'displays the total number of food items to buy' do
    visit general_shopping_lists_path(recipe_id: @recipe1.id)
    expect(page).to have_content('Amount of food items to buy : 0')
  end
end
