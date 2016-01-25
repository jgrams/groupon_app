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

ActiveRecord::Schema.define(version: 20160125095147) do

  create_table "first_inputs", force: :cascade do |t|
    t.integer  "num_options"
    t.string   "deal_type"
    t.string   "biz_name"
    t.string   "longer_descriptor"
    t.boolean  "multi_voucher"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "first_inputs", ["biz_name"], name: "index_first_inputs_on_biz_name"
  add_index "first_inputs", ["deal_type"], name: "index_first_inputs_on_deal_type"
  add_index "first_inputs", ["longer_descriptor"], name: "index_first_inputs_on_longer_descriptor"
  add_index "first_inputs", ["num_options"], name: "index_first_inputs_on_num_options"

end
