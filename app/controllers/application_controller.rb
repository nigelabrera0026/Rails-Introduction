class ApplicationController < ActionController::Base
  def index
    @fave_dishes = FaveDish.includes(:country_dish).page(params[:page]).per(10)
  end
end
