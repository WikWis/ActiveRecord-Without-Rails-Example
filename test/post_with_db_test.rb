require 'bundler/setup'
require 'date'
require 'test-unit'
require_relative '../lib/ActiveRecord-Without-Rails-Example/post'
require_relative '../lib/ActiveRecord-Without-Rails-Example/user'

class PostWithDbTest < Test::Unit::TestCase
  def setup
    ActiveRecord::Base.establish_connection(YAML::load(File.open('../config/test.yml')))
    User.destroy_all
    Post.destroy_all
  end

  def test_get_posts_from_db
    assert_equal([], Post.all)
  end

  def test_add_post_to_db
    user = User.create(name: "John", surname: "Smith", birth_day: Date.new(2000, 12, 12))
    post = Post.create(title: "Funny promise", body: "Someday i'll be funny", user_id: user.id)
    assert_equal(post, user.posts.first, "Post wasn't created")
  end

  def test_find_post_from_db
    user = User.create(name: "John", surname: "Smith", birth_day: Date.new(2000, 12, 12))
    post = Post.create(title: "Funny promise", body: "Someday i'll be funny", user_id: user.id)
    assert_equal(post, user.posts.find(post.id), "Post doesn't exist")
  end

  def test_delete_post_from_db
    user = User.create(name: "John", surname: "Smith", birth_day: Date.new(2000, 12, 12))
    post = Post.create(title: "Funny promise", body: "Someday i'll be funny", user_id: user.id)
    user.posts.delete(post)
    assert_equal(0, user.posts.size, "Post doesn't exist")
  end

  def test_update_post_from_db
    user = User.create(name: "John", surname: "Smith", birth_day: Date.new(2000, 12, 12))
    post = Post.create(title: "Funny promise", body: "Someday i'll be funny", user_id: user.id)
    user.posts.first.update(title: "Edited Title")

    assert_equal(true, user.posts.first.update(title: "Edited Title"))
  end

  def teardown
    User.destroy_all
    Post.destroy_all
  end
end