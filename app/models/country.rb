class Country < ApplicationRecord
  validates :name, presence:true
  validates :longitude, :latitude, :region, presence: true

  has_many :country_dishes, dependent: :destroy
  has_many :dishes, through: :country_dishes
end
