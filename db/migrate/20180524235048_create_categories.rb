class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.references :category
      t.string :name, null: false
      t.text :description

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
