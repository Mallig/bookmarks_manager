require './app'
require 'pg'

feature 'adds bookmarks' do

  scenario 'can add a url and id to the database' do
    visit '/'
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('title', with: 'Makers Academy')
    click_button('Save URL')
    visit '/bookmarks'
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
