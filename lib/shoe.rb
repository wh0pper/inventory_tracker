#!/usr/bin/env ruby
class Shoe < ActiveRecord::Base
  validates :name, {:presence => true, :length => {:maximum => 100}, uniqueness: {case_sensitive: false}}
  has_many :inventories
  has_many :stores, through: :inventories
end
