class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredients
  
  validates :dish_id, presence: true
  validates :ingredient_id, presence: true
end
