class ChangeUserReferenceToFoodInRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    # Remove the existing user_id foreign key
    remove_reference :recipe_foods, :user, foreign_key: true

    # Add a new foreign key reference to the food table
    add_reference :recipe_foods, :food, null: false, foreign_key: true
  end
end
