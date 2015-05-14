ENV['RACK_ENV'] = 'test'

require('spec_helper')
Capybara.app = Sinatra::Application
require('./app')
set(:show_exceptions, false)

describe('the cookbook app', type: :feature) do
  describe('the root path') do
    it('visits the home page') do
      visit('/')
      expect(page).to have_content('Cookbook')
    end
  end

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
