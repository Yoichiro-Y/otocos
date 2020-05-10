class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.text :explain
      t.string :image_name
      t.integer :brand_id

      t.timestamps
    end
  end
end
