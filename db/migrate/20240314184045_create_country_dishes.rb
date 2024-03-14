class CreateCountryDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :country_dishes do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
