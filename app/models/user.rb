class User < ApplicationRecord
  has_many :fave_dishes
  has_many :country_dishes, through: :fave_dishes
end
