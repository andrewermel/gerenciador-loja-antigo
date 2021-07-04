class CreateEstoques < ActiveRecord::Migration[6.1]
  def change
    create_table :estoques do |t|
      t.string :item
      t.float :valor

      t.timestamps
    end
  end
end
