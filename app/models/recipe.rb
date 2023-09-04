class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods
  has_many :foods
end
