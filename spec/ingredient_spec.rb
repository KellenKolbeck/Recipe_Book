require("spec_helper")

describe(Ingredient) do
  it("will validate prescence of name") do
    ingredient = Ingredient.new({:name => ""})
    expect(ingredient.save()).to(eq(false))
  end
end
