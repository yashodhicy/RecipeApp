class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods

  validates :name, :preparation_time, :cooking_time, :description, :user_id, presence: true
  validates :preparation_time, :cooking_time, numericality: { only_integer: true }
end
