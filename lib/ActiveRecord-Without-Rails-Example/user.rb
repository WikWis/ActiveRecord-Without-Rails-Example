require 'bundler/setup'
require 'active_record'

class User < ActiveRecord::Base
  has_many :posts
  def to_s
    "id: #{self.id}, name: #{self.name}, lastname: #{self.surname}, birthday: #{self.birth_day.strftime('%d-%m-%Y')}"
  end
end
