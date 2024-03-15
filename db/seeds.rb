# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "net/http"
require "json"
require "faker"

# Populating Country
url = URI("https://restcountries.com/v3.1/all")
response = Net::HTTP.get(url)
countries = JSON.parse(response)

countries.first(1000).each do |country|
  name =       country["name"]["common"]
  longitude =  country["latlng"][1].to_s
  latitude =   country["latlng"][0].to_s
  region =     country["region"]
  population = country["population"]

  Country.create(
    name:       name,
    longitude:  longitude,
    latitude:   latitude,
    region:     region,
    population: population
  )
end

# Populating Dish
url = URI("https://raw.githubusercontent.com/drmonkeyninja/country.json/master/src/country-by-national-dish.json")
response = Net::HTTP.get(url)
json_dish = JSON.parse(response)

json_dish.each do |cousine|
  Dish.create(name: cousine["dish"])
end

# Populating Users
300.times do
  User.create(
    name:Faker::Internet.username,
    pwd: Faker::Internet.password(
      min_length:         10,
      max_length:         20,
      mix_case:           true,
      special_characters: true
    )
  )
end

# Populating countrydish
json_dish.each do |dish|
  country_name = dish["country"]
  dish_name    = dish["dish"]
  # If it's not there then continue.
  next if country_name.blank? || dish_name.blank?

  # Refer from tables.
  country = Country.find_by(name: country_name)
  national_dish = Dish.find_by(name: dish_name) # This line is changed to find a Dish

  # Invoke creation
  CountryDish.create(country: country, dish: national_dish) if country && national_dish
end

# # Populating Fave dish
client = User.all
5.times do
  client.each do |users|
    fave = CountryDish.order("RANDOM()").first
    FaveDish.find_or_create_by(
      user:         users,
      country_dish: fave
    )
  end
end
