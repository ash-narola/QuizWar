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

ActiveRecord::Schema.define(version: 2019_04_11_111309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "valid_option", default: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "name"
    t.bigint "setter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setter_id"], name: "index_questionnaires_on_setter_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.string "question"
    t.integer "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "user_answered_questionnaires", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "questionnaire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_user_answered_questionnaires_on_questionnaire_id"
    t.index ["user_id"], name: "index_user_answered_questionnaires_on_user_id"
  end

  create_table "user_questionnaire_answers", force: :cascade do |t|
    t.bigint "user_answered_questionnaire_id"
    t.bigint "question_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_user_questionnaire_answers_on_answer_id"
    t.index ["question_id"], name: "index_user_questionnaire_answers_on_question_id"
    t.index ["user_answered_questionnaire_id"], name: "user_ans_que"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "questionnaires", "users", column: "setter_id"
  add_foreign_key "user_answered_questionnaires", "questionnaires"
  add_foreign_key "user_answered_questionnaires", "users"
  add_foreign_key "user_questionnaire_answers", "answers"
  add_foreign_key "user_questionnaire_answers", "questions"
  add_foreign_key "user_questionnaire_answers", "user_answered_questionnaires"
end
