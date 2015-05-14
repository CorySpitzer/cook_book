require('spec_helper')

describe('the ingredients pages',type: :feature) do
  describe('the individual ingredient path') do
    it('displays the recipes that an ingredient is used in') do
      recipe = Recipe.create(name: 'bread', instructions: 'bake it')
      ingredient = Ingredient.create(name: 'salt')
      ingredient.recipes.push(recipe)
      visit("/ingredient/#{ingredient.id}")
      expect(page).to have_content(recipe.name)
    end
  end
end
