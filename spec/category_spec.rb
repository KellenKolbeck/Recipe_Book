require("spec_helper")

describe(Category) do
  it("will validate prescence of name") do
    category = Category.new({:name => ""})
    expect(category.save()).to(eq(false))
  end
end
