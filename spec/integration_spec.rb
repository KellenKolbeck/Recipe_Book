require("spec_helper")

describe("/categories", {:type => :feature}) do
  it("will allow the user to add a new category") do
    visit("/categories")
    fill_in("name", :with => "Italian Food")
    click_button("Submit")
    expect(page).to have_content("Italian Food")
  end
end
