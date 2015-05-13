require('spec_helper')

describe(Ingredient) do
  it('has many recipes') do
    ingredient = Ingredient.create(name: 'rice')
    recipe1 = Recipe.create(name: 'biryani', instructions: 'cook it a while')
    recipe2 = Recipe.create(name: 'gumbo', instructions: 'should have seafood')
    ingredient.recipes.push([recipe1, recipe2])
    expect(ingredient.recipes).to(eq([recipe1, recipe2]))
  end
end
