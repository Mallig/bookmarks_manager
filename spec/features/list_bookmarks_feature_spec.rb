require './app'
require 'pg'


feature 'bookmark list' do
  before(:each) do
    clear_test_database
  end

  scenario 'can output users bookmarks' do
    add_test_bookmarks
    visit '/'
    click_button 'Show Bookmarks'
    expect(page).to have_content 'www.makersacademy.com'
    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'www.reddit.com'
  end
end
