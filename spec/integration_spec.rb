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
  it("will allow a user to update a category name") do
    test_category = Category.new({:name => "Italian Food"})
    test_category.save()
    visit("/categories/#{test_category.id()}")
    fill_in("name", :with => "Italiano Food")
    click_button("Edit")
    expect(page).to have_content("Italiano Food")
  end

  it("will allow a user to delete a category name") do
    test_category = Category.new({:name => "Italian Food"})
    test_category.save()
    visit("/categories/#{test_category.id()}")
    click_button('Delete')
    expect(page).to have_content("")
  end
end

describe("/ingredients", {:type => :feature}) do
  it("will allow the user to add a new ingredient and display all the ingredients") do
    visit("/ingredients")
    fill_in("name", :with => "Sugar")
    click_button("Submit")
    expect(page).to have_content("Sugar")
  end
end

describe("/ingredients/:id", {:type => :feature}) do
  it("will allow a user to update a ingredient name") do
    test_ingredient = Ingredient.new({:name => "Salt"})
    test_ingredient.save()
    visit("/ingredients/#{test_ingredient.id()}")
    fill_in("name", :with => "Italian Food")
    click_button("Edit")
    expect(page).to have_content("Italian Food")
  end

  it("will allow a user to delete and ingredient name") do
    test_ingredient = Ingredient.new({:name => "Salt"})
    test_ingredient.save()
    visit("/ingredients/#{test_ingredient.id()}")
    click_button("Delete")
    expect(page).to have_content("")
  end
end

describe("/recipes", {:type => :feature}) do
  it("will save a new recipe and display all the recipes on the page") do
    visit("/recipes")
    fill_in("name", :with => "Justin's Surprise")
    click_button("Submit")
    expect(page).to have_content("Justin's Surprise")
  end
end
