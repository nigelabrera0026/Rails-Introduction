class Dish < ApplicationRecord
  validates :name, presence: true

  has_many :country_dishes
  has_many :countries, through: :country_dishes
end
