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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121020203108) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.integer  "holes"
    t.integer  "yards"
    t.integer  "par"
    t.string   "facility"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "phone"
    t.string   "link"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "linkedin_id"
    t.string   "picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "company"
    t.integer  "company_id"
    t.string   "location"
    t.string   "industry"
    t.integer  "home_course"
    t.string   "schedule"
    t.text     "connections"
    t.integer  "handicap",             :default => 0
    t.string   "public_linkedin_link"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "players", ["company_id"], :name => "index_players_on_company_id"
  add_index "players", ["email"], :name => "index_players_on_email", :unique => true
  add_index "players", ["linkedin_id"], :name => "index_players_on_linkedin_id", :unique => true

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
