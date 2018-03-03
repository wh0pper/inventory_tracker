require 'spec_helper'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'shoe creation', {:type => :feature} do
  it 'takes shoe name and price, normalizes info, adds it to page' do
    visit '/'
    click_button('Add a shoe')
    fill_in('new_shoe_name', :with => 'converse')
    fill_in('new_shoe_price', :with => 45)
    within '#add_shoe' do
      click_button('Add')
    end
    expect(page).to have_content('Converse')
    expect(page).to have_content('$45.00')
  end
end

describe 'shoe update and deletion', {:type => :feature} do
  it 'takes shoe name and price, normalizes info, adds it to page' do
    shoe = Shoe.create({:name => "Chuck Taylor", :price => 49.50})
    visit "/shoe/#{shoe.id}"
    click_button('Edit info')
    fill_in('update_name', :with => 'converse')
    click_button('Update')
    expect(page).to have_content('Converse')
    click_button('Remove from system')
    expect(page).to have_no_content('Converse')
  end
end
