require 'bundler/setup'
require 'active_record'

class Post < ActiveRecord::Base
  belongs_to :users
  def to_s
    "id: #{self.id}, title: #{self.title}, body: #{self.body}, user_id: #{self.user_id}"
  end
end