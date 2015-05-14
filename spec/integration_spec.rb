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

  it('the add a new recipe form path') do
    visit('/recipe_form')
    fill_in('recipe_name', with: 'bread')
    fill_in('instructions', with: 'bake it')
    click_button('Add')
    expect(page).to have_content('bread')
  end
  
end
