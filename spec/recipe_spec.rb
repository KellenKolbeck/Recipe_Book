require("spec_helper")

describe(Recipe) do
  it("will validate prescence of name") do
    recipe = Recipe.new({:name => ""})
    expect(recipe.save()).to(eq(false))
  end
end
