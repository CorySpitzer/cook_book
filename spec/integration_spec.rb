require('spec_helper')
# require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the cookbook app', type: :feature) do
  describe('the root path') do
    it('visits the home page') do
      visit('/')
      expect(page).to have_content('Cookbook')
    end
  end
end
