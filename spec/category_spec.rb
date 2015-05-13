require('spec_helper')

describe(Category) do
  it('has many recipes') do
    category = Category.create(name: 'vegetarian')
    recipe = Recipe.create(name: 'rice', instructions: 'cook it a while')
    category.recipes.push(recipe)
    expect(category.recipes).to(eq([recipe]))
  end
end
