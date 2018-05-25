# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_25_005109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name", null: false
    t.text "description"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "email"
    t.text "shipping_address"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "option_values", force: :cascade do |t|
    t.bigint "option_id", null: false
    t.string "name", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id", "name"], name: "index_option_values_on_option_id_and_name", unique: true
    t.index ["option_id"], name: "index_option_values_on_option_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_lines", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "variant_id", null: false
    t.decimal "price", null: false
    t.integer "amount", default: 1, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id", "variant_id"], name: "index_order_lines_on_order_id_and_variant_id", unique: true
    t.index ["order_id"], name: "index_order_lines_on_order_id"
    t.index ["variant_id"], name: "index_order_lines_on_variant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "customer_id", null: false
    t.boolean "paid", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "product_options", force: :cascade do |t|
    t.bigint "option_id", null: false
    t.bigint "product_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id", "product_id"], name: "index_product_options_on_option_id_and_product_id", unique: true
    t.index ["option_id"], name: "index_product_options_on_option_id"
    t.index ["product_id"], name: "index_product_options_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name", null: false
    t.text "description"
    t.boolean "hidden", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "variant_option_values", force: :cascade do |t|
    t.bigint "variant_id", null: false
    t.bigint "option_value_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_value_id"], name: "index_variant_option_values_on_option_value_id"
    t.index ["variant_id", "option_value_id"], name: "index_variant_option_values_on_variant_id_and_option_value_id", unique: true
    t.index ["variant_id"], name: "index_variant_option_values_on_variant_id"
  end

  create_table "variants", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "sku", null: false
    t.string "barcode"
    t.decimal "price", null: false
    t.decimal "amount", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

end
