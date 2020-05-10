class AddColumnToMicropost < ActiveRecord::Migration[6.0]
  def change
     add_column :microposts, :product_id, :integer
  end
end
