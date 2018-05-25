class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :name, null: false

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
