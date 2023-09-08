# spec/features/recipes_spec.rb

require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  include Devise::Test::IntegrationHelpers

  before(:all) do
    Recipe.delete_all  
    User.destroy_all
    
    @user = User.create!(name: 'Mahmood',
                         email: 'mahmood@mail.com',
                         password: '123456',
                         password_confirmation: '123456',
                         confirmed_at: Time.now)
    @recipe1 = Recipe.create(user: @user,
                             name: 'Chicken Biryani',
                             description: 'Delicious chicken biryani with salad and curd',
                             preparation_time: 30,
                             cooking_time: 60)
    @recipe2 = Recipe.create(user: @user,
                             name: 'Pasta',
                             description: 'Delicious pasta',
                             preparation_time: 30,
                             cooking_time: 50)
    @recipes = Recipe.all
  end

  before(:each) do
    sign_in @user
  end

  it 'I can see the recipes titles' do
    visit recipes_path
    @recipes.each do |recipe|
      expect(page).to have_content(recipe.name)
    end
  end

  it 'I can see the recipes descriptions' do
    visit recipes_path
    @recipes.each do |recipe|
      expect(page).to have_content(recipe.description)
    end
  end

  it 'When I click on a recipe, it takes me to the details' do
    visit recipes_path
    click_link @recipe1.name
    expect(page).to have_current_path(recipe_path(@recipe1))
  end
end
