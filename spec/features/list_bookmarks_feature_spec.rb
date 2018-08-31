require './app'

feature 'bookmark list' do

  scenario 'can output users bookmarks' do
    add_test_bookmarks
    visit '/'
    click_button 'Show Bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.reddit.com'
  end
end
