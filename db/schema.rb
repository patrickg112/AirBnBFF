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

ActiveRecord::Schema.define(version: 20160826141810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hosts", force: :cascade do |t|
    t.string   "username"
    t.string   "bio"
    t.string   "address"
    t.string   "city_state"
    t.integer  "host_expectations"
    t.integer  "openness"
    t.integer  "conscientiousness"
    t.integer  "extraversion"
    t.integer  "agreeableness"
    t.integer  "emotional_range"
    t.string   "profile_link"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "host_id"
    t.integer  "traveler_id"
    t.boolean  "compatible"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "host_id"
    t.integer  "traveler_id"
    t.boolean  "positive_review"
    t.string   "reviewable_type"
    t.integer  "reviewable_id"
    t.text     "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["host_id"], name: "index_reviews_on_host_id", using: :btree
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id", using: :btree
    t.index ["traveler_id"], name: "index_reviews_on_traveler_id", using: :btree
  end

  create_table "travelers", force: :cascade do |t|
    t.string   "username"
    t.string   "bio"
    t.integer  "guest_expectations"
    t.integer  "openness"
    t.integer  "conscientiousness"
    t.integer  "extraversion"
    t.integer  "agreeableness"
    t.integer  "emotional_range"
    t.string   "profile_link"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
