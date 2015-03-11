# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150308120800) do

  create_table "exhibits", force: :cascade do |t|
    t.integer  "museum_id",  limit: 4
    t.string   "name",       limit: 255
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "msg_id",         limit: 8,    null: false
    t.string   "to_user_name",   limit: 255,  null: false
    t.string   "from_user_name", limit: 255,  null: false
    t.datetime "create_time",                 null: false
    t.string   "msg_type",       limit: 255,  null: false
    t.string   "content",        limit: 1024, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "messages", ["msg_id"], name: "index_messages_on_msg_id", unique: true, using: :btree

  create_table "museums", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "flag",        limit: 255, null: false
    t.string   "home_url",    limit: 255, null: false
    t.string   "exhibit_url", limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "museums", ["flag"], name: "index_museums_on_flag", unique: true, using: :btree
  add_index "museums", ["name"], name: "index_museums_on_name", unique: true, using: :btree

end
