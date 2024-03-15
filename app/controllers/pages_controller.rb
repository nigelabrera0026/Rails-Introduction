class PagesController < ApplicationController
  def about
  end

  def index
    @fave_dishes = FaveDish.includes(:country_dish).page(params[:page]).per(10)
    @regions = Country.distinct.pluck(:region)

    if params[:region].present? && params[:region] != 'All Regions'
      params[:search] = "" # resets so it queries once
      @fave_dishes = @fave_dishes.joins(country_dish: :country)
                                 .where('countries.region = ?', params[:region])

    end

    if params[:search].present?  # && params[:region].present?
      # Implement multi purpose search logic
      # Todo: implement logic for search country also
      @fave_dishes = @fave_dishes.joins(country_dish: :dish)
                                 .where('dishes.name LIKE ?', "%#{params[:search]}%")
                                 .page(params[:page]).per(10)
    end


  end
end
