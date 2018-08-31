require './app'
require 'pg'

feature 'adds bookmarks' do

  scenario 'can add a url and id to the database' do
    visit '/'
    fill_in('url', with: 'www.makersacademy.com')
    click_button('Save URL')
    visit '/bookmarks'
    expect(page).to have_content 'www.makersacademy.com'
  end
end
