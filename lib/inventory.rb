#!/usr/bin/env ruby
class Inventory < ActiveRecord::Base
  belongs_to :shoe
  belongs_to :store
end
