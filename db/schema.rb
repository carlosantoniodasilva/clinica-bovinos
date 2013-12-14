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

ActiveRecord::Schema.define(version: 20131214220058) do

  create_table "bovinos", force: true do |t|
    t.integer  "fazenda_id"
    t.integer  "numero"
    t.string   "nome"
    t.string   "pai"
    t.string   "mae"
    t.string   "raca"
    t.string   "pelagem"
    t.string   "sexo"
    t.date     "data_nascimento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bovinos_rebanhos", id: false, force: true do |t|
    t.integer "bovino_id",  null: false
    t.integer "rebanho_id", null: false
  end

  create_table "fazendas", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inseminacoes", force: true do |t|
    t.integer  "bovino_id"
    t.integer  "inseminador_id"
    t.date     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inseminacoes", ["bovino_id"], name: "index_inseminacoes_on_bovino_id"
  add_index "inseminacoes", ["inseminador_id"], name: "index_inseminacoes_on_inseminador_id"

  create_table "inseminadores", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rebanhos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
