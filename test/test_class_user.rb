require 'bundler/setup'
require 'test-unit'
require_relative '../lib/ActiveRecord-Without-Rails-Example/user'

class TestClassUser < Test::Unit::TestCase

  def setup
    @excepted_to_s_value = "id: 1, name: Andrzej, lastname: Duda, birthday: 16-05-1972"
    ActiveRecord::Base.establish_connection(YAML::load(File.open('../config/test.yml')))
  end

  def test_create_user
    user = User.new do |u|
      u.id = 1
      u.name ="Andrzej"
      u.surname = "Duda"
      u.birth_day = Date.new(1972,5,16)
    end

    assert_equal(
        @excepted_to_s_value,
        user.to_s,
        "Error with creating user"
    )
  end
end