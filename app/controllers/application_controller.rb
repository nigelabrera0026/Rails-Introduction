class ApplicationController < ActionController::Base
  def index
    @fave_dishes = FaveDish.includes(:country_dish).limit(10)
  end
end
