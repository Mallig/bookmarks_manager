require './app'

feature 'bookmark list' do

  scenario 'can output users bookmarks' do
    add_test_bookmarks
    visit '/'
    click_button 'Show Bookmarks'
    expect(page).to have_content 'www.makersacademy.com'
    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'www.reddit.com'
  end
end
