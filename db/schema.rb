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

ActiveRecord::Schema.define(version: 20140104203636) do

  create_table "bookcase_books", force: true do |t|
    t.integer  "book_id"
    t.integer  "bookcase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookcases", force: true do |t|
    t.string   "name"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.text     "title_array"
    t.string   "authors"
    t.text     "authors_array"
    t.string   "publisher"
    t.string   "published_date"
    t.text     "description"
    t.integer  "isbn"
    t.integer  "page_count"
    t.string   "categories"
    t.float    "average_rating"
    t.integer  "ratings_count"
    t.string   "language"
    t.string   "preview_link"
    t.string   "info_link"
    t.string   "image_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
