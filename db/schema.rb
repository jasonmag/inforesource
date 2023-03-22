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

ActiveRecord::Schema[7.0].define(version: 2023_03_20_160032) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_coordinates", force: :cascade do |t|
    t.string "lat"
    t.string "lng"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_address_coordinates_on_address_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address_name"
    t.string "city"
    t.string "postal_code"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_coordinates_id"
    t.index ["address_coordinates_id"], name: "index_addresses_on_address_coordinates_id"
  end

  create_table "user_banks", force: :cascade do |t|
    t.string "card_expire"
    t.string "card_number"
    t.string "card_type"
    t.string "currency"
    t.string "iban"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_user_banks_on_users_id"
  end

  create_table "user_companies", force: :cascade do |t|
    t.string "department"
    t.string "name"
    t.string "title"
    t.bigint "addresses_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addresses_id"], name: "index_user_companies_on_addresses_id"
  end

  create_table "user_hairs", force: :cascade do |t|
    t.string "color"
    t.string "type_name"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_user_hairs_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "maiden_name"
    t.integer "age"
    t.string "gender"
    t.string "email"
    t.string "phone"
    t.string "username"
    t.string "password"
    t.date "birth_date"
    t.string "image"
    t.string "blood_group"
    t.string "height"
    t.string "weight"
    t.string "eye_color"
    t.string "domain"
    t.string "ip"
    t.string "mac_address"
    t.string "university"
    t.string "ein"
    t.string "ssn"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "addresses_id"
    t.bigint "user_hairs_id"
    t.bigint "user_banks_id"
    t.bigint "user_companies_id"
    t.index ["addresses_id"], name: "index_users_on_addresses_id"
    t.index ["user_banks_id"], name: "index_users_on_user_banks_id"
    t.index ["user_companies_id"], name: "index_users_on_user_companies_id"
    t.index ["user_hairs_id"], name: "index_users_on_user_hairs_id"
  end

  add_foreign_key "address_coordinates", "addresses"
  add_foreign_key "addresses", "address_coordinates", column: "address_coordinates_id"
  add_foreign_key "user_banks", "users", column: "users_id"
  add_foreign_key "user_companies", "addresses", column: "addresses_id"
  add_foreign_key "user_hairs", "users", column: "users_id"
  add_foreign_key "users", "addresses", column: "addresses_id"
  add_foreign_key "users", "user_banks", column: "user_banks_id"
  add_foreign_key "users", "user_companies", column: "user_companies_id"
  add_foreign_key "users", "user_hairs", column: "user_hairs_id"
end
