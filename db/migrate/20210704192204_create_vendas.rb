class CreateVendas < ActiveRecord::Migration[6.1]
  def change
    create_table :vendas do |t|
      t.string :item
      t.float :valor

      t.timestamps
    end
  end
end
