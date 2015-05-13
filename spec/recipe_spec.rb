# require('spec_helper')
#
# describe(Recipe) do
#   it('has many ingredients') do
#     recipe = Recipe.create(name: 'biryani', instructions: 'cook slowly')
#     # rice = Ingredient.create(name: 'rice')
#     rice = recipe.ingredients.new(name: 'rice')
#     rice.save
#     #
#     # chicken = Ingredient.create(name: 'chicken')
#     # # recipe.ingredients.push(chicken)
#     expect(recipe.ingredients.include?(rice)).to(eq(true))
#   end
# end
