require('spec_helper')

describe('the recipe pages', type: :feature) do
  describe('the add a new recipe form path') do
    it('displays a newly added recipe') do
      visit('/recipe_form')
      fill_in('recipe_name', with: 'bread')
      fill_in('instructions', with: 'bake it')
      click_button('Add')
      expect(page).to have_content('bread')
    end
  end

  describe('the individual recipe path') do
    it('displays the instructions on the recipe page') do
      recipe = Recipe.create(name: 'bread', instructions: 'bake it')
      visit("/recipe/#{recipe.id}")
      expect(page).to(have_content(recipe.instructions))
    end
  end

  describe('the rating path') do
    it('displays the average rating for a recipe') do
      recipe = Recipe.create(name: 'bread', instructions: 'bake it')
      recipe.ratings.create(value: 5)
      recipe.ratings.create(value: 4)
      visit("/recipe/#{recipe.id}")
      expect(page).to have_content("Average rating: #{recipe.average_rating}")
    end

    it('clicks a radio button') do
      recipe = Recipe.create(name: 'bread', instructions: 'bake it')
      visit("/recipe/#{recipe.id}")
      choose('one')
      click_button('Rate')
      expect(page).to have_content('Average rating: 1')
    end
  end

  it('lists the recipes in order of rating') do
    bread = Recipe.create(name: 'bread', instructions: 'bake it')
    soup = Recipe.create(name: 'soup', instructions: 'put veggies in and cook')
    soup.ratings.create(value: 5)
    bread.ratings.create(value: 3)
    visit('/recipes')
    expect(page).to have_content('soup bread')
  end

end
