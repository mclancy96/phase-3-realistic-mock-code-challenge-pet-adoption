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

ActiveRecord::Schema.define(version: 2025_07_31_171906) do

  create_table "adopters", force: :cascade do |t|
    t.string "name"
  end

  create_table "adoptions", force: :cascade do |t|
    t.integer "adopter_id"
    t.integer "shelter_id"
    t.index ["adopter_id"], name: "index_adoptions_on_adopter_id"
    t.index ["shelter_id"], name: "index_adoptions_on_shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.integer "founded_year"
  end

  add_foreign_key "adoptions", "adopters"
  add_foreign_key "adoptions", "shelters"
end
