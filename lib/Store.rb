#!/usr/bin/env ruby
class Store < ActiveRecord::Base
  validates :name, :presence => true, uniqueness: {case_sensitive: false}
  has_many :inventories
  has_many :shoes, through: :inventories
end
