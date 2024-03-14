class FaveDishesController < ApplicationController
  def show
    @fave_dish = FaveDish.find(params[:id])
  end
end
