require("spec_helper")

describe(Instruction) do
  it("will validate prescence of name") do
    instruction = Instruction.new({:name => ""})
    expect(instruction.save()).to(eq(false))
  end
end
