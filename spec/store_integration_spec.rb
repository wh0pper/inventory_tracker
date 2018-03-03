require 'spec_helper'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'shoe assignment', {:type => :feature} do
  it 'takes shoe name and price, normalizes info, adds it to page' do
    store = Store.create({:name => "Shooz 4 U"})
    shoe = Shoe.create({:name => "Chuck Taylor", :price => 49.50})
    visit "/store/#{store.id}"
    select("#{shoe.name}", :from => 'new_shoe')
    fill_in('send_quantity', :with => 100)
    click_button('Add')
    expect(page).to have_content('Chuck Taylor')
    expect(page).to have_content('100')
  end
end
