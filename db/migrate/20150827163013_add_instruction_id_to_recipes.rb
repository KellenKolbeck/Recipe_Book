class AddInstructionIdToRecipes < ActiveRecord::Migration
  def change
    add_column(:recipes, :instruction_id, :int)
  end
end
