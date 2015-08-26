class CreateRecipes < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:instructions, :string)
      t.column(:category_id, :int)
      t.column(:ingredient_id, :int)

      t.timestamps
    end
  end
end
