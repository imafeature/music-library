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

ActiveRecord::Schema.define(version: 20151101205147) do

  create_table "albums", force: :cascade do |t|
    t.integer  "label_id"
    t.string   "title"
    t.string   "artist"
    t.string   "genre"
    t.integer  "year"
    t.date     "added"
    t.integer  "plays"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "albums", ["label_id"], name: "index_albums_on_label_id"

  create_table "albums_artists", id: false, force: :cascade do |t|
    t.integer "albums_id",  null: false
    t.integer "artists_id", null: false
    t.integer "album_id"
    t.integer "artist_id"
  end

  add_index "albums_artists", ["album_id", "artist_id"], name: "index_albums_artists_on_album_id_and_artist_id", unique: true

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.integer  "founded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "genre"
    t.integer  "year"
    t.date     "added"
    t.integer  "plays"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
