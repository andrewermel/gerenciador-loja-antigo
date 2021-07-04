class CreateCompras < ActiveRecord::Migration[6.1]
  def change
    create_table :compras do |t|
      t.string :item
      t.float :valor

      t.timestamps
    end
  end
end
