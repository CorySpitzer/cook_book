require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  erb(:index)
end

get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipes)
end

get('/recipe_form') do
  erb(:recipe_form)
end

post('/recipes') do
  instructions = params.fetch('instructions')
  recipe_name = params.fetch('recipe_name')
  @recipe = Recipe.create(name: recipe_name, instructions: instructions)
  redirect('/recipes')
end
