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

ActiveRecord::Schema.define(version: 20171218232012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "needies", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "latitude"
    t.string   "longitude"
    t.text     "description"
    t.integer  "quantity_person"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "needies_has_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "needy_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_needies_has_categories_on_category_id", using: :btree
    t.index ["needy_id"], name: "index_needies_has_categories_on_needy_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "username"
    t.string   "phone"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "users_has_categories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_users_has_categories_on_category_id", using: :btree
    t.index ["user_id"], name: "index_users_has_categories_on_user_id", using: :btree
  end

  create_table "users_has_needies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "needy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["needy_id"], name: "index_users_has_needies_on_needy_id", using: :btree
    t.index ["user_id"], name: "index_users_has_needies_on_user_id", using: :btree
  end

  add_foreign_key "needies_has_categories", "categories"
  add_foreign_key "needies_has_categories", "needies"
  add_foreign_key "users_has_categories", "categories"
  add_foreign_key "users_has_categories", "users"
  add_foreign_key "users_has_needies", "needies"
  add_foreign_key "users_has_needies", "users"
end
