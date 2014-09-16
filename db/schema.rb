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

ActiveRecord::Schema.define(version: 20140916055010) do

  create_table "nas", force: true do |t|
    t.string  "nasname",     limit: 128,                           null: false
    t.string  "shortname",   limit: 32
    t.string  "type",        limit: 30,  default: "other"
    t.integer "ports"
    t.string  "secret",      limit: 60,  default: "secret",        null: false
    t.string  "server",      limit: 64
    t.string  "community",   limit: 50
    t.string  "description", limit: 200, default: "RADIUS Client"
  end

  add_index "nas", ["nasname"], name: "nasname", using: :btree

  create_table "radacct", primary_key: "radacctid", force: true do |t|
    t.string   "acctsessionid",        limit: 64, default: "", null: false
    t.string   "acctuniqueid",         limit: 32, default: "", null: false
    t.string   "username",             limit: 64, default: "", null: false
    t.string   "groupname",            limit: 64, default: "", null: false
    t.string   "realm",                limit: 64, default: ""
    t.string   "nasipaddress",         limit: 15, default: "", null: false
    t.string   "nasportid",            limit: 15
    t.string   "nasporttype",          limit: 32
    t.datetime "acctstarttime"
    t.datetime "acctstoptime"
    t.integer  "acctsessiontime"
    t.string   "acctauthentic",        limit: 32
    t.string   "connectinfo_start",    limit: 50
    t.string   "connectinfo_stop",     limit: 50
    t.integer  "acctinputoctets",      limit: 8
    t.integer  "acctoutputoctets",     limit: 8
    t.string   "calledstationid",      limit: 50, default: "", null: false
    t.string   "callingstationid",     limit: 50, default: "", null: false
    t.string   "acctterminatecause",   limit: 32, default: "", null: false
    t.string   "servicetype",          limit: 32
    t.string   "framedprotocol",       limit: 32
    t.string   "framedipaddress",      limit: 15, default: "", null: false
    t.integer  "acctstartdelay"
    t.integer  "acctstopdelay"
    t.string   "xascendsessionsvrkey", limit: 10
  end

  add_index "radacct", ["acctsessionid"], name: "acctsessionid", using: :btree
  add_index "radacct", ["acctsessiontime"], name: "acctsessiontime", using: :btree
  add_index "radacct", ["acctstarttime"], name: "acctstarttime", using: :btree
  add_index "radacct", ["acctstoptime"], name: "acctstoptime", using: :btree
  add_index "radacct", ["acctuniqueid"], name: "acctuniqueid", using: :btree
  add_index "radacct", ["framedipaddress"], name: "framedipaddress", using: :btree
  add_index "radacct", ["nasipaddress"], name: "nasipaddress", using: :btree
  add_index "radacct", ["username"], name: "username", using: :btree

  create_table "radcheck", force: true do |t|
    t.string "username",  limit: 64,  default: "",   null: false
    t.string "attribute", limit: 64,  default: "",   null: false
    t.string "op",        limit: 2,   default: "==", null: false
    t.string "value",     limit: 253, default: "",   null: false
  end

  add_index "radcheck", ["username"], name: "username", length: {"username"=>32}, using: :btree

  create_table "radchecks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "radgroupcheck", force: true do |t|
    t.string "groupname", limit: 64,  default: "",   null: false
    t.string "attribute", limit: 64,  default: "",   null: false
    t.string "op",        limit: 2,   default: "==", null: false
    t.string "value",     limit: 253, default: "",   null: false
  end

  add_index "radgroupcheck", ["groupname"], name: "groupname", length: {"groupname"=>32}, using: :btree

  create_table "radgroupreply", force: true do |t|
    t.string "groupname", limit: 64,  default: "",  null: false
    t.string "attribute", limit: 64,  default: "",  null: false
    t.string "op",        limit: 2,   default: "=", null: false
    t.string "value",     limit: 253, default: "",  null: false
  end

  add_index "radgroupreply", ["groupname"], name: "groupname", length: {"groupname"=>32}, using: :btree

  create_table "radpostauth", force: true do |t|
    t.string    "username", limit: 64, default: "", null: false
    t.string    "pass",     limit: 64, default: "", null: false
    t.string    "reply",    limit: 32, default: "", null: false
    t.timestamp "authdate",                         null: false
  end

  create_table "radreply", force: true do |t|
    t.string "username",  limit: 64,  default: "",  null: false
    t.string "attribute", limit: 64,  default: "",  null: false
    t.string "op",        limit: 2,   default: "=", null: false
    t.string "value",     limit: 253, default: "",  null: false
  end

  add_index "radreply", ["username"], name: "username", length: {"username"=>32}, using: :btree

  create_table "radusergroup", id: false, force: true do |t|
    t.string  "username",  limit: 64, default: "", null: false
    t.string  "groupname", limit: 64, default: "", null: false
    t.integer "priority",             default: 1,  null: false
  end

  add_index "radusergroup", ["username"], name: "username", length: {"username"=>32}, using: :btree

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_digest"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
