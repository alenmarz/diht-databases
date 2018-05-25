class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.references :product, null: false
      t.string :sku, null: false, unique: true
      t.string :barcode, unique: true
      t.decimal :price, null: false
      t.decimal :amount, null: false

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
