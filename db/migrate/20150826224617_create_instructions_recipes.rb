class CreateInstructionsRecipes < ActiveRecord::Migration
  def change
    create_table(:instructions_recipes) do |t|
      t.column(:instruction_id, :int)
      t.column(:recipe_id, :int)

      t.timestamps
    end
  end
end
