class PagesController < ApplicationController
  def about
  end

  def index
    if params[:search].present?
      # Implement multi purpose search logic
      # Todo: implement logic for search country also
      @fave_dishes = FaveDish.joins(country_dish: :dish)
                             .where('LOWER(dishes.name) LIKE ?', "%#{params[:search].downcase}%")

    else
      # No search, just list favorite dishes
      @fave_dishes = FaveDish.includes(:country_dish).limit(10)
    end
  end
end
