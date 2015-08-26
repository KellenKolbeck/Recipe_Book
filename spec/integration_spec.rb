require("spec_helper")

describe("/categories", {:type => :feature}) do
  it("will allow the user to add a new category and display all categories on the page") do
    visit("/categories")
    fill_in("name", :with => "Italian Food")
    click_button("Submit")
    expect(page).to have_content("Italian Food")
  end
end

describe("/categories/:id", {:type => :feature}) do
  it("will allow a user to update a category name and display recipes") do
    test_category = Category.new({:name => "Italian Food"})
    test_category.save()
    visit("/categories/#{test_category.id()}")
    fill_in("name", :with => "Italiano Food")
    click_button("Edit")
    expect(page).to have_content("Italiano Food")
  end
end
