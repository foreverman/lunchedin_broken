class CreateTagsVenues < ActiveRecord::Migration
  def change
    create_table :tags_venues do |t|
      t.integer :venue_id
      t.integer :tag_id
      t.timestamps null: false
    end
  end
end
