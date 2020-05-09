class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :explain
      t.string :image_name

      t.timestamps
    end
  end
end
