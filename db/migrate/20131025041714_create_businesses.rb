class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :website
      t.string :fb_url
      t.integer :likes
      t.string :user_name
      t.string :email
      t.text :description

      t.timestamps
    end

    add_index :businesses, :likes
  end
end
