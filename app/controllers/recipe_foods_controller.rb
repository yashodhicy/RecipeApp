class RecipeFoodsController < ApplicationController
  def new
    @user = current_user
    @foods = Food.all
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.build(ref_params.merge(recipe_id: @recipe.id))
    respond_to do |format|
      format.html do
        if @recipe_food.save
          redirect_to recipe_path(@recipe), notice: 'ingredient was successfully added.'
        else
          render :new
          flash.now[:alert] = 'Ingredient could not be added. Please try again.'
        end
      end
    end
  end

  def destroy
    @user = current_user
    @recipe_food = RecipeFood.find(params[:id]) # Find the Recipe_food item by its own ID
    @recipe = @recipe_food.recipe # Get the associated Recipe

    if @recipe_food.destroy
      redirect_to recipe_path(@recipe), notice: 'Food was successfully deleted from the recipe.'
    else
      redirect_to recipe_path(@recipe), alert: 'Failed to delete food from the recipe.'
    end
  end

  private

  def ref_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
