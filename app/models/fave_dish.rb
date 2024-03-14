class FaveDish < ApplicationRecord
  belongs_to :user
  belongs_to :country_dish
end
