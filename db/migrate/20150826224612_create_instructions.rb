class CreateInstructions < ActiveRecord::Migration
  def change
    create_table(:instructions) do |t|
      t.column(:description, :string)
      t.column(:recipe_id, :int)

      t.timestamps
    end
  end
end
