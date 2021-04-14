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

ActiveRecord::Schema.define(version: 2021_04_13_171226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "nationality", null: false
    t.string "email", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "model", null: false
    t.integer "year", null: false
    t.bigint "chassis_number", null: false
    t.string "color", null: false
    t.date "registration_date", null: false
    t.bigint "odometer_reading", null: false
    t.bigint "user_id", null: false
    t.index ["model"], name: "index_vehicles_on_model"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

end
