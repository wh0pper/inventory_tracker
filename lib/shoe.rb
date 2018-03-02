#!/usr/bin/env ruby

class Shoe < ActiveRecord::Base
  attr_accessor :formatted_price

  validates :name, {:presence => true, :length => {:maximum => 100}, uniqueness: {case_sensitive: false}}
  validates :price, {:presence => true}
  has_many :inventories
  has_many :stores, through: :inventories

  def formatted_price
    @formatted_price = '$' + '%.2f' % self.price
  end
end
