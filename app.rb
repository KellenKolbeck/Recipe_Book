require("bundler/setup")
Bundler.require(:default)
require("./lib/category")
require("./lib/ingredient")

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
  erb(:categories)
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
  erb(:view_category)
end

delete('/categories/:id') do
  @new_category = Category.find(params.fetch('id').to_i)
  @new_category.delete()
  @categories = Category.all()
  redirect(:categories)
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
  erb(:ingredients)
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
  erb(:view_ingredient)
end

delete('/ingredients/:id') do
  @new_ingredient = Ingredient.find(params.fetch('id').to_i)
  @new_ingredient.delete()
  @ingredients = Ingredient.all()
  redirect(:ingredients)
end
