class PagesController < ApplicationController
  def about
  end

  def index
    @fave_dishes = FaveDish.includes(:country_dish).page(params[:page]).per(10)

    @regions = Country.distinct.pluck(:region)

    if params[:search].present?  # && params[:region].present?
      # Implement multi purpose search logic
      # Todo: implement logic for search country also
      @fave_dishes = FaveDish.joins(country_dish: :dish)
                             .where(coountry_dish: { country: :dish })
                             .page(params[:page]).per(10)
    end

    if params[:region].present? && params[:region] != 'All Regions'
      # Join with countries to apply the region filter
      @fave_dishes = @fave_dishes.joins(country_dish: :country)
                                 .where('countries.region = ?', params[:region])
    end
  end
end
