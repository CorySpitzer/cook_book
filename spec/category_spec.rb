require('spec_helper')

describe(Category) do
  it('has many recipes') do
    category = Category.create(name: 'vegetarian')
    recipe = Recipe.create(name: 'rice', instructions: 'cook it a while')
    category.recipes.push(recipe)
    expect(category.recipes).to(eq([recipe]))
  end

  # it('belongs to many recipes') do
  #   category = Category.create(name: 'vegetarian')
  #   recipe1 = Recipe.create(name: 'rice', instructions: 'cook it a while')
  #   recipe2 = Recipe.create(name: 'veggies', instructions: "cook quickly")
  #   category.recipes.push([recipe1, recipe2])
  #   expect(recipe.categories).to(eq([recipe1, recipe2]))
  # end

end
