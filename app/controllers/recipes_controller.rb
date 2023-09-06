class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @recipes = @user.recipes.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      format.html do
        if @recipe.save
          redirect_to recipes_path, notice: 'Recipe created successfully.'
        else
          render :new
          flash.now[:alert] = 'recipe could not be added. Please try again.'
        end
      end
    end
  end

  def destroy
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe deleted successfully.'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
