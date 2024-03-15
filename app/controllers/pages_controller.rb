class PagesController < ApplicationController
  def about
  end

  def index
    @fave_dishes = FaveDish.includes(country_dish: { country: :dishes }).page(params[:page]).per(10)
    @regions = Country.distinct.pluck(:region)
    @countries = Country.order(:name).distinct

    if params[:search].present?
      @fave_dishes = @fave_dishes.joins(country_dish: { dish: [:dish_ingredients, :ingredients] })
                                 .where('dishes.name LIKE :search OR ingredients.name LIKE :search', search: "%#{params[:search]}%").page(params[:page]).per(10)
    end

    if params[:region].present? && params[:region] != 'All Regions'
      @fave_dishes = @fave_dishes.joins(country_dish: :country)
                                 .where(countries: { region: params[:region] }).page(params[:page]).per(10)
    end

    if params[:country].present?
      @fave_dishes = @fave_dishes.joins(country_dish: :country)
                                 .where(countries: { id: params[:country] }).page(params[:page]).per(10)
    end

    @fave_dishes = @fave_dishes.distinct.page(params[:page]).per(10)
    # @fave_dishes = FaveDish.includes(country_dish: { dish: :ingredients }).page(params[:page]).per(10)
    # @regions = Country.distinct.pluck(:region)
    # @top_ingredients = Ingredient.limit(10)

    # if params[:ingredient].present? || params[:search].present?
    #   # Start with a base scope for joining the necessary tables
    #   base_scope = FaveDish.joins(country_dish: { dish: :dish_ingredients }).joins("JOIN ingredients ON ingredients.id = dish_ingredients.ingredients_id")

    #   # If an ingredient is selected, narrow down the base scope to dishes that include the selected ingredient
    #   if params[:ingredient].present?
    #     base_scope = base_scope.where('dish_ingredients.ingredients_id = ?', params[:ingredient])
    #   end

    #   # If a search term is provided, further narrow down the scope to filter by dish or ingredient name
    #   if params[:search].present?
    #     base_scope = base_scope.where('dishes.name LIKE :search OR ingredients.name LIKE :search', search: "%#{params[:search]}%")
    #   end

    #   # Apply pagination and remove duplicates
    #   @fave_dishes = base_scope.distinct.page(params[:page]).per(10)
    # end

    # if params[:region].present? && params[:region] != 'All Regions'
    #   @fave_dishes = @fave_dishes.joins(country_dish: :country)
    #                              .where('countries.region = ?', params[:region])
    # end
    # @fave_dishes = FaveDish.includes(:country_dish).page(params[:page]).per(10)
    # @regions = Country.distinct.pluck(:region)

    # if params[:region].present? && params[:region] != 'All Regions'
    #   params[:search] = "" # resets so it queries once
    #   @fave_dishes = @fave_dishes.joins(country_dish: :country)
    #                              .where('countries.region = ?', params[:region])

    # end

    # if params[:search].present?  # && params[:region].present?
    #   # Implement multi purpose search logic
    #   # Todo: implement logic for search country also
    #   @fave_dishes = @fave_dishes.joins(
    #     country_dish: { dish: :dish_ingredients }
    #     ).joins(
    #       "JOIN ingredients ON ingredients.id = dish_ingredients.ingredients_id"
    #       ).where(
    #         'dishes.name LIKE :search OR ingredients.name LIKE :search', search: "%#{params[:search]}%")
    #         .page(params[:page]).per(10)

    # end
  end
end
