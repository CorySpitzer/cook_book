require('bundler/setup')
Bundler.require(:default, :production)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  erb(:index)
end

get('/error') do
  erb(:error)
end

get('/recipes') do
  @recipes = Recipe.all
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

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  @ingredients = Ingredient.all()
  erb(:single_recipe)
end

post('/recipe/:id') do
  id = params.fetch('id')
  ingredient_name = params.fetch('ingredient_name')
  recipe = Recipe.find(id)
  ingredient = recipe.ingredients.create(name:ingredient_name)
  if ingredient.valid?
    redirect("/recipe/#{id}")
  else
    redirect('/error')
  end
end

get('/ingredient/:id') do
  @ingredient = Ingredient.find(params.fetch('id'))
  erb(:single_ingredient)
end

post('/rating/:recipe_id') do |id|
  recipe = Recipe.find(id)
  rating_value = params.fetch('rating_value').to_i
  recipe.ratings.create(value: rating_value)
  redirect("/recipe/#{id}")
end
