class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient, foreign_key: "ingredients_id"
  validates :dish_id, presence: true
  validates :ingredients_id, presence: true
end
