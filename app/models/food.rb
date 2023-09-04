class Food < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods
end
