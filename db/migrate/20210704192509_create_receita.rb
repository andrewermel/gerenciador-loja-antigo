class CreateReceita < ActiveRecord::Migration[6.1]
  def change
    create_table :receita do |t|
      t.float :valor

      t.timestamps
    end
  end
end
