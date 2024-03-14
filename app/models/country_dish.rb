class CountryDish < ApplicationRecord
  belongs_to :dish
  belongs_to :country

  validates :country_id, presence: true
  validates :dish_id, presence: true

  has_many :fave_dishes, dependent: :destroy
end
