#!/usr/bin/env ruby
class Inventory < ActiveRecord::Base
  belongs_to :shoe
  belongs_to :store

  validates_uniqueness_of :store_id, :scope => [:shoe_id]
end
