class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient, foreign_key: 'ingredients_id'
  validates :dish, presence: true
  validates :ingredients, presence: true
end
