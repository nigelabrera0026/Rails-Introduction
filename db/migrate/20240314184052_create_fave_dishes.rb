class CreateFaveDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :fave_dishes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :country_dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
