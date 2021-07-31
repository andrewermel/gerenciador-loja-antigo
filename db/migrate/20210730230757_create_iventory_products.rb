class CreateIventoryProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :iventory_products do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
