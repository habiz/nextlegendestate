class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.integer :property_id
      t.string :property_type
      t.string :city
      t.date :property_date
      t.integer :number_of_rooms
      t.string :area_size
      t.string :per_unit_price

      t.timestamps
    end
  end
end
