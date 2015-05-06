require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('librarian link path', {:type => :feature}) do
  it('bring you to the librarian page') do
    visit('/')
    click_link('Click Here!')
    expect(page).to have_content('Hi Librarian')
    fill_in('title', :with => 'Hi There')
    fill_in('author', :with => 'Smart T. Pants')
    click_button('Add Book!')
    expect(page).to have_content("Hi There")
  end
end
