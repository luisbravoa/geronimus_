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

ActiveRecord::Schema.define(version: 20150627174551) do

  create_table "albums", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "artist_id",  limit: 4
    t.integer  "user_id",    limit: 4
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "artist_id",  limit: 4
    t.integer  "album_id",   limit: 4
    t.boolean  "public",     limit: 1,   default: false
    t.integer  "duration",   limit: 4
    t.string   "file",       limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id", using: :btree
  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id", using: :btree
  add_index "songs", ["user_id"], name: "index_songs_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255, null: false
    t.string   "email",           limit: 255, null: false
    t.string   "first_name",      limit: 255, null: false
    t.string   "last_name",       limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
