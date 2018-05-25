class CreateVariantOptionValues < ActiveRecord::Migration[5.2]
  def change
    create_table :variant_option_values do |t|
      t.references :variant, null: false
      t.references :option_value, null: false

      t.datetime :deleted_at
      t.timestamps
    end

    add_index :variant_option_values, [:variant_id, :option_value_id], unique: true
  end
end
