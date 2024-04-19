# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_19_181332) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "weight_category", ["oz_1", "oz_1_2", "oz_1_4", "oz_1_10", "oz_1_20", "other"]

  create_table "coins", force: :cascade do |t|
    t.string "name", null: false
    t.integer "release_year"
    t.string "mint_name"
    t.decimal "weight"
    t.enum "weight_category", null: false, enum_type: "weight_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "coin_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_listings_on_coin_id"
    t.index ["shop_id"], name: "index_listings_on_shop_id"
  end

  create_table "prices", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.integer "price"
    t.datetime "scraped_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_prices_on_listing_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "listings", "coins"
  add_foreign_key "listings", "shops"
  add_foreign_key "prices", "listings"
end
