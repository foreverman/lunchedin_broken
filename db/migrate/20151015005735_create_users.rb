class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password
      t.string :email
      t.string :zip_code
      t.integer :role_id, default: 2

      t.timestamps null: false
    end
  end
end
