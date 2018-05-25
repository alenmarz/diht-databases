class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status, null: false, default: 0 # new
      t.references :customer, null: false
      t.boolean :paid, null: false, default: false

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
