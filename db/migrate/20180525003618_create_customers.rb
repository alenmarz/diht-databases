class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email
      t.text :shipping_address

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
