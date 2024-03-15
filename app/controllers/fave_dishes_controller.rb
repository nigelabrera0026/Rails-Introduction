class FaveDishesController < ApplicationController
  def show
    @fave_dish = FaveDish.find(params[:id])
    @ingredients = @fave_dish.country_dish.dish.ingredients.limit(5)
  end
end
