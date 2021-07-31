class CreateBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :balances do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :price_per_unity

      t.timestamps
    end
  end
end
