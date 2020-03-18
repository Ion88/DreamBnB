feature 'See all spaces' do
  scenario 'See the list of spaces' do
    space = Space.create(space_name: "Sunny Appartment", space_description: "test description", space_price: "500", from_date: "01/01/01", to_date: "01/01/01")
    visit('/spaces')
    expect(page).to have_content "Sunny Appartment"
  end
end
