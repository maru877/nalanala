class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.string :name
      t.integer :rent
      t.string :address
      t.integer :building_age
      t.text :remarks
      t.timestamps
    end
  end
end
