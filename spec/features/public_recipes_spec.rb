require 'rails_helper'

RSpec.describe 'Public Recipes List', type: :system do
  include Devise::Test::IntegrationHelpers

  before(:all) do
    delete_all
    set_users
    @mahmood = User.find_or_create_by(email: 'mahmood@gmail.com') do |user|
      user.name = 'Mahmood'
      user.password = '123456'
      user.password_confirmation = '123456'
      user.confirmed_at = Time.now
    end
    @nasir = User.find_or_create_by(email: 'nasir@gmail.com') do |user|
      user.name = 'Nasir'
      user.password = 'password123'
      user.password_confirmation = 'password123'
      user.confirmed_at = Time.now
    end
    @recipe1 = Recipe.create(user: @mahmood,
                             name: 'Pasta',
                             preparation_time: 30,
                             cooking_time: 40,
                             description: 'Delicious pasta',
                             public: true)
    @recipe2 = Recipe.create(user: @nasir,
                             name: 'Chicken biryani',
                             preparation_time: 40,
                             cooking_time: 60,
                             description: 'Delicious chicken biryani',
                             public: true)
    @public_recipes = Recipe.where(public: true)
  end

  before(:each) do
    sign_in @mahmood
  end

  it 'displays the public recipes list' do
    visit public_recipes_path
    expect(page).to have_content('Public Recipes List')
  end

  it 'displays public recipes with their details' do
    visit public_recipes_path

    @public_recipes.each do |recipe|
      expect(page).to have_content(recipe.name)
      expect(page).to have_content("By: #{recipe.user.name}")
    end
  end

  def delete_all
    Food.delete_all
    Recipe.delete_all
  end

  def set_users; end
end
