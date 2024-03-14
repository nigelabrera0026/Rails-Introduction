class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :longitude
      t.string :latitude
      t.string :region
      t.integer :population

      t.timestamps
    end
  end
end
