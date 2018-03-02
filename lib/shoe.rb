#!/usr/bin/env ruby
class Shoe < ActiveRecord::Base
  has_many :inventories
  has_many :stores, through: :inventories 
end
