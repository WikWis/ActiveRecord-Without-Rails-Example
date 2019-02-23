require 'bundler/setup'
require 'date'
require 'test-unit'
require_relative '../lib/ActiveRecord-Without-Rails-Example/user'

class UserWithDbTest < Test::Unit::TestCase
  def setup
    ActiveRecord::Base.establish_connection(YAML::load(File.open('../config/test.yml')))
    User.destroy_all
  end

  def test_get_users_from_db
    assert_equal([], User.all)
  end

  def test_add_user_to_db
    user = User.create(name: "Kamil", surname: "Kowalski", birth_day: Date.new(1999, 3, 4))
    assert_equal(user, User.last, "User wasn't saved")
  end

  def test_find_user_from_db
    user = User.create(name: "Kamil", surname: "Kowalski", birth_day: Date.new(1999, 3, 4))
    assert_equal(user, User.find(user.id), "User doesn't exist")
  end

  def test_delete_user_from_db
    user = User.create(name: "Kamil", surname: "Kowalski", birth_day: Date.new(1999, 3, 4))
    User.destroy(user.id)
    assert_equal(0, User.all.size, "User wasn't deleted")
  end

  def test_update_user_from_db
    user = User.create(name: "Kamil", surname: "Kowalski", birth_day: Date.new(1999, 3, 4))
    user.update(name: "Konrad")

    assert_equal(user, User.find_by(name: "Konrad"), "User wasn't updated")
  end

  def teardown
    User.destroy_all
  end
end