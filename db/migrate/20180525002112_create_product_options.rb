class CreateProductOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :product_options do |t|
      t.references :option, null: false
      t.references :product, null: false

      t.datetime :deleted_at
      t.timestamps
    end

    add_index :product_options, [:option_id, :product_id], unique: true
  end
end
