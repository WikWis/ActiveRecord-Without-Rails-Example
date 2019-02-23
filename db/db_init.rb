require 'bundler/setup'
require 'active_record'
require 'yaml'

ActiveRecord::Base.establish_connection(YAML::load(File.open('../config/development.yml')))

ActiveRecord::Schema.define do
  create_table(:users, force: true) do |t|
    t.string :name, null: false
    t.string :surname, null: false
    t.date :birth_day, null: false
    t.timestamps
  end

  create_table(:posts, force: true) do |t|
    t.belongs_to :user, index: true
    t.string :title, null: false
    t.text :body, null:false
    t.timestamps
  end
end

ActiveRecord::Base.establish_connection(YAML::load(File.open('../config/test.yml')))

ActiveRecord::Schema.define do
  create_table(:users, force: true) do |t|
    t.string :name, null: false
    t.string :surname, null: false
    t.date :birth_day, null: false
    t.timestamps
  end

  create_table(:posts, force: true) do |t|
    t.belongs_to :user, index: true
    t.string :title, null: false
    t.text :body, null:false
    t.timestamps
  end
end