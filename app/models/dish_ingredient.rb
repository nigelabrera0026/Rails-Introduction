class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient, foreign_key: "ingredients_id"
  validates :dish, presence: true
  validates :ingredient, presence: true
end
