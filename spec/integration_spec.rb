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
  end
end
