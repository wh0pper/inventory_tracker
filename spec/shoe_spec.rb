require 'spec_helper'

describe('Shoe') do
  it("has many stores through inventories") do
    shoe = Shoe.create({:name => "Chuck Taylor"})
    store1 = Store.create({:name => "Shooz 4 U"})
    store2 = Store.create({:name => "Shoes! Shoes! Shoes!"})
    shoe.stores.push(store1, store2)
    expect(shoe.stores).to(eq([store1, store2]))
    expect(shoe.inventories.first.store_id).to(eq(store1.id))
  end
end

describe(Shoe) do
  it {should validate_uniqueness_of(:name)}

  it {should validate_presence_of(:name)}
end
