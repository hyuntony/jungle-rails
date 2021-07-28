require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can see the product details when product partial is clicked" do
    # ACT
    visit root_path

    # CLICK
    button = page.first(:button, 'Add').click
    
    cart = page.find_link(href: '/cart')
    expect(cart).to have_content 'My Cart (1)'
    save_screenshot
  end
end
