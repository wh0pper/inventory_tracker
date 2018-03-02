require 'spec_helper'

describe('Store') do
  it("has many shoes through inventories") do
    store = Store.create({:name => "Shooz 4 U"})
    shoe1 = Shoe.create({:name => "Chuck Taylor", :price => 49.50})
    shoe2 = Shoe.create({:name => "Deluxe Boot", :price => 89.95})
    store.shoes.push(shoe1, shoe2)
    expect(store.shoes).to(eq([shoe1, shoe2]))
    expect(store.inventories.first.shoe_id).to(eq(shoe1.id))
  end

  describe('#titleize callback') do
    it('capitalizes first letter of all words in any submission') do
      store1 = Store.create({:name => "shoes for you"})
      expect(store1.name).to(eq('Shoes For You'))
    end
  end
end

describe(Store) do
  it {should validate_uniqueness_of(:name)}

  it {should validate_presence_of(:name)}

  it {should validate_length_of(:name)}
end
