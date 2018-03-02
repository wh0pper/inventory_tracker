#!/usr/bin/env ruby
class Store < ActiveRecord::Base
  validates :name, {:presence => true, :length => {:maximum => 100}, uniqueness: {case_sensitive: false}}
  has_many :inventories
  has_many :shoes, through: :inventories

  before_create do
    self.name = name.titleize
  end
end
