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

ActiveRecord::Schema.define(version: 20140803200217) do

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "isbn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discussions", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "reading_group_id"
    t.integer  "parent_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reading_groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "invite_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reading_groups_users", id: false, force: true do |t|
    t.integer "reading_group_id"
    t.integer "user_id"
  end

  create_table "recommendations", force: true do |t|
    t.integer  "book_id"
    t.integer  "reading_group_id"
    t.integer  "user_id"
    t.boolean  "recommended"
    t.text     "review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image_url"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
