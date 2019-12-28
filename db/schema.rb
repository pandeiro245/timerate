# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_28_201859) do

  create_table "events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "person_id", null: false
    t.datetime "started_at"
    t.datetime "stopped_at"
    t.integer "duration"
    t.float "rate"
    t.float "limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_events_on_person_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "token"
    t.integer "user_id"
    t.integer "create_user_id"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "word_people", force: :cascade do |t|
    t.integer "word_id", null: false
    t.integer "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_word_people_on_person_id"
    t.index ["word_id"], name: "index_word_people_on_word_id"
  end

  create_table "word_users", force: :cascade do |t|
    t.integer "word_id", null: false
    t.integer "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_word_users_on_person_id"
    t.index ["word_id"], name: "index_word_users_on_word_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_words_on_user_id"
  end

  add_foreign_key "events", "people"
  add_foreign_key "events", "users"
  add_foreign_key "people", "users"
  add_foreign_key "word_people", "people"
  add_foreign_key "word_people", "words"
  add_foreign_key "word_users", "people"
  add_foreign_key "word_users", "words"
  add_foreign_key "words", "users"
end
