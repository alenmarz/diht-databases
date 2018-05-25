class CreateOptionValues < ActiveRecord::Migration[5.2]
  def change
    create_table :option_values do |t|
      t.references :option, null: false
      t.string :name, null: false

      t.datetime :deleted_at
      t.timestamps
    end

    add_index :option_values, [:option_id, :name], unique: true
  end
end
