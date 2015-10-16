class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.string :fax_number
      t.integer :price, default: 2
      t.integer :ratings_count, default: 0

      t.timestamps null: false
    end
  end
end
