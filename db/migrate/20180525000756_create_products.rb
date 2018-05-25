class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category
      t.string :name, null: false
      t.text :description
      t.boolean :hidden, null: false, default: false

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
