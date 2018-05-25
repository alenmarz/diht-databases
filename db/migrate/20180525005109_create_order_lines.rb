class CreateOrderLines < ActiveRecord::Migration[5.2]
  def change
    create_table :order_lines do |t|
      t.references :order, null: false
      t.references :variant, null: false
      t.decimal :price, null: false
      t.integer :amount, null: false, default: 1

      t.datetime :deleted_at
      t.timestamps
    end

    add_index :order_lines, [:order_id, :variant_id], unique: true
  end
end
