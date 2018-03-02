#!/usr/bin/env ruby
class Store < ActiveRecord::Base
  has_many :inventories
  has_many :shoes, through: :inventories
end
