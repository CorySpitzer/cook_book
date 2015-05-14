require('spec_helper')

describe(Recipe) do
  it('has many ingredients') do
    recipe = Recipe.create(name: 'biryani', instructions: 'cook slowly')
    salt = Ingredient.create(name: 'salt')
    recipe.ingredients.push(salt)
    expect(recipe.ingredients).to eq([salt])
  end

  it { should have_many(:ratings) }

  describe('#average_rating') do
    it("returns the average of all ratings for a recipe") do
      recipe = Recipe.create(name: 'bread', instructions: 'bake it')
      recipe.ratings.create(value: 4)
      recipe.ratings.create(value: 3)
      expect(recipe.average_rating).to(eq(3.5))
    end
  end
end
