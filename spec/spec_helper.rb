ENV['RACK_ENV'] = 'test'
require 'rspec' 
require 'pry'
require 'pg'
require 'Brand'
require 'Store'

RSpec.configure do |config|
  config.after(:each) do
    Brand.all().each() do |brand|
      brand.destroy()
    end
  end
    Store.all().each() do |store|
      store.destroy()
    end
  end
end
