require './app'

feature 'bookmark list' do

  scenario 'can output users bookmarks' do
    add_test_bookmarks
    visit '/'
    click_button 'Show Bookmarks'
    expect(page).to have_link 'Makers Academy'
    expect(page).to have_link 'Google'
    expect(page).to have_link 'Reddit'
  end
end
