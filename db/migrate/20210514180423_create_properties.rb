class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.integer :price
      t.string :direction
      t.string :area
      t.integer :rooms
      t.integer :bathrooms
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
