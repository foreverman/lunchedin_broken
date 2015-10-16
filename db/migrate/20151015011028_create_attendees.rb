class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :email
      t.string :status, default: 'invited'
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
