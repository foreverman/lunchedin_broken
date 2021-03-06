class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :subject
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
