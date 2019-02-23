require 'bundler/setup'
require 'test-unit'
require_relative '../lib/ActiveRecord-Without-Rails-Example/post'

class TestClassPost < Test::Unit::TestCase
  def setup
    ActiveRecord::Base.establish_connection(YAML::load(File.open('../config/test.yml')))
    @excepted_to_s_value = "id: 1, title: some title, body: some body, user_id: 1"
  end

  def test_create_post
    post = Post.new do |p|
      p.id = 1
      p.title = "some title"
      p.body = "some body"
      p.user_id = 1
    end

    assert_equal(@excepted_to_s_value, post.to_s, "Error with creating user")
  end

end