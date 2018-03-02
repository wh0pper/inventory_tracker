#!/usr/bin/env ruby

class Shoe < ActiveRecord::Base
  attr_reader :formatted_price

  validates :name, {:presence => true, :length => {:maximum => 100}, uniqueness: {case_sensitive: false}}
  validates :price, {:presence => true}
  has_many :inventories
  has_many :stores, through: :inventories

  before_save do
    self.name = name.titleize
  end

  after_initialize do |user|
    if self.price
      @formatted_price = '$' + '%.2f'%self.price
    end
  end

end
