require('spec_helper')

describe(Recipe) do
  it('has many ingredients') do
    recipe = Recipe.create(name: 'biryani', instructions: 'cook slowly')
    salt = Ingredient.create(name: 'salt')
    recipe.ingredients.push(salt)
    expect(recipe.ingredients).to eq([salt])
  end
end
