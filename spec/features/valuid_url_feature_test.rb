require './app'

feature 'URL validity check' do

  scenario 'checks a url validity' do
    visit '/'
    fill_in('url', with: 'www.makersacademy.com')
    click_button('Save URL')
    expect(page).to have_content 'Invalid URL'
  end

end
