require 'spec_helper'

describe('Store') do
  it("has many shoes through inventories") do
    store = Store.create({:name => "Shooz 4 U"})
    shoe1 = Shoe.create({:name => "Chuck Taylor"})
    shoe2 = Shoe.create({:name => "Deluxe Boot"})
    store.shoes.push(shoe1, shoe2)
    expect(store.shoes).to(eq([shoe1, shoe2]))
    expect(store.inventories.first.shoe_id).to(eq(shoe1.id))
  end
end
