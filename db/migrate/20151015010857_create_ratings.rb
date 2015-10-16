class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :venue_id
      t.integer :user_id
      t.integer :score
      t.integer :ratings_count

      t.timestamps null: false
    end
  end
end
