require("bundler/setup")
Bundler.require(:default)
require("./lib/category")
require("./lib/ingredient")
require("./lib/recipe")
require("./lib/instruction")
require('pry')

get("/") do
  erb(:index)
end

get("/categories") do
  @categories = Category.all()
  erb(:categories)
end

post("/categories") do
  name = params.fetch("name")
  category = Category.new({:name => name})
  category.save()
  @categories = Category.all()
  redirect("/categories")
end

get('/categories/:id') do
  @new_category = Category.find(params.fetch('id').to_i)
  erb(:view_category)
end

patch('/categories/:id') do
  @new_category = Category.find(params.fetch('id').to_i)
  name = params.fetch('name')
  @new_category.update({:name => name})
  @new_category = Category.find(params.fetch('id').to_i)
  redirect("/categories/#{@new_category.id()}")
end

delete('/categories/:id') do
  @new_category = Category.find(params.fetch('id').to_i)
  @new_category.delete()
  @categories = Category.all()
  redirect("/categories")
end

get("/ingredients") do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post("/ingredients") do
  name = params.fetch("name")
  ingredient = Ingredient.new({:name => name})
  ingredient.save()
  @ingredients = Ingredient.all()
  redirect("/ingredients")
end

get('/ingredients/:id') do
  @new_ingredient = Ingredient.find(params.fetch('id').to_i)
  erb(:view_ingredient)
end

patch('/ingredients/:id') do
  @new_ingredient = Ingredient.find(params.fetch('id').to_i)
  name = params.fetch('name')
  @new_ingredient.update({:name => name})
  @new_ingredient = Ingredient.find(params.fetch('id').to_i)
  redirect("/ingredients/#{@new_ingredient.id()}")
end

delete('/ingredients/:id') do
  @new_ingredient = Ingredient.find(params.fetch('id').to_i)
  @new_ingredient.delete()
  @ingredients = Ingredient.all()
  redirect("/ingredients")
end

get("/recipes") do
  @recipes = Recipe.all()
  erb(:recipes)
end

post("/recipes") do
  name = params.fetch("name")
  instruction_id = params.fetch("instruction_id")
  category_id = params.fetch("category_id")
  ingredient_id = params.fetch("ingredient_id")
  recipe = Recipe.new({:name => name, :instruction_id => instruction_id, :category_id => category_id, :ingredient_id => ingredient_id})
  recipe.save()
  @recipes = Recipe.all()
  redirect("/recipes")
end

get("/recipes/:id") do
  @new_recipe = Recipe.find(params.fetch("id").to_i)
  @instructions = @new_recipe.instructions()
  erb(:view_recipe)
end

delete("/recipes/:id") do
  @new_recipe = Recipe.find(params.fetch("id").to_i)
  @new_recipe.delete()
  @recipes = Recipe.all()
  redirect("/recipes")
end

post("/recipes/:id/instructions") do
  description = params.fetch("description")
  recipe_id = params.fetch("recipe_id")
  @new_recipe = Recipe.find(params.fetch("id").to_i)
  @new_instruction = Instruction.new(:description => description, :recipe_id => recipe_id)
  @new_instruction.save()
  @instructions = @new_recipe.instructions()
  redirect("/recipes/#{@new_recipe.id()}")
end

patch("/recipes/:id/instructions/:instruction_id") do
  @new_instruction = Instruction.find(params.fetch("instruction_id"))
  edit_description = params.fetch("edit_description")
  recipe_id = params.fetch("id")
  @new_recipe = Recipe.find(params.fetch("id").to_i)
  @new_instruction.update({:description => edit_description, :recipe_id => recipe_id})
  @instructions = @new_recipe.instructions().order("id ASC")
  redirect("/recipes/#{@new_recipe.id()}")
end

delete("/recipes/:id/instructions/:instruction_id") do
  @new_recipe = Recipe.find(params.fetch("id").to_i)
  @new_instruction = Instruction.find(params.fetch("instruction_id"))
  @new_instruction.delete()
  @instructions = @new_recipe.instructions().order("id ASC")
  redirect("/recipes/#{@new_recipe.id}")
end
