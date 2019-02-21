require 'bundler/setup'
require 'date'
require 'active_record'
require 'yaml'

class User < ActiveRecord::Base
  def to_s
    "id: #{self.id}, name: #{self.name}, lastname: #{self.surname}, birthday: #{self.birth_day.strftime('%d-%m-%Y')}"
  end
end
