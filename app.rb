require("bundler/setup")
Bundler.require(:default)
require("./lib/category")

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
  erb(:view_category)
end
