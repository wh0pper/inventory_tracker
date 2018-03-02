require 'spec_helper'

describe('Shoe') do
  it("has many stores through inventories") do
    shoe = Shoe.create({:name => "Chuck Taylor", :price => 49.50})
    store1 = Store.create({:name => "Shooz 4 U"})
    store2 = Store.create({:name => "Shoes! Shoes! Shoes!"})
    shoe.stores.push(store1, store2)
    expect(shoe.stores).to(eq([store1, store2]))
    expect(shoe.inventories.first.store_id).to(eq(store1.id))
  end

  describe('#formatted_price callback') do
    it('has a formatted price associated with the instance but not in the database') do
      shoe = Shoe.create({:name => "Chuck Taylor", :price => 49.5})
      expect(shoe.formatted_price).to(eq('$49.50'))
    end
  end
end

describe(Shoe) do
  it {should validate_uniqueness_of(:name)}

  it {should validate_presence_of(:name)}

  it {should validate_length_of(:name)}
end
