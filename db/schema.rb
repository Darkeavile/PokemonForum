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

ActiveRecord::Schema.define(version: 20160101185639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forums", force: :cascade do |t|
    t.string   "title"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "roleplaying"
  end

  add_index "forums", ["category_id"], name: "index_forums_on_category_id", using: :btree

  create_table "group_memberships", force: :cascade do |t|
    t.string   "role"
    t.string   "scope"
    t.date     "joined_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groupmemberships", force: :cascade do |t|
    t.string   "role"
    t.string   "scope"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groupmemberships", ["group_id"], name: "index_groupmemberships_on_group_id", using: :btree
  add_index "groupmemberships", ["user_id"], name: "index_groupmemberships_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "members"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.boolean  "url"
    t.text     "about"
    t.text     "signature"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "lastpost"
    t.integer  "totalposts"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "replies", force: :cascade do |t|
    t.text     "content"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "replies", ["topic_id"], name: "index_replies_on_topic_id", using: :btree
  add_index "replies", ["user_id"], name: "index_replies_on_user_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "topics", ["forum_id"], name: "index_topics_on_forum_id", using: :btree
  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.integer  "profile_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "forums", "categories"
  add_foreign_key "groupmemberships", "groups"
  add_foreign_key "groupmemberships", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "replies", "topics"
  add_foreign_key "replies", "users"
  add_foreign_key "topics", "forums"
  add_foreign_key "topics", "users"
end
