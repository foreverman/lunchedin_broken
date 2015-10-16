class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps null: false
    end
    %w{admin user}.each { |r| Role.create(name: r) }
  end
end
