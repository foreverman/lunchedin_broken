class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :occurs_on
      t.string :status, default: 'planning'
      t.text :notes
      t.integer :user_id
      t.integer :venue_id

      t.timestamps null: false
    end
  end
end
