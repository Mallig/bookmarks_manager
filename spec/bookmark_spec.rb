require 'bookmark'

describe Bookmark do

# it 'can access to a database' do
#   expect(Bookmark.conn).to be_a(# PG connection type ?)
# end

  context 'when testing' do
    it 'will connect to a test database for tests' do
      expect(Bookmark.db).to eq 'bookmark_manager_test'
    end
  end

  it 'can read from a database' do
    add_test_bookmarks
    expect(Bookmark.all[0]).to include 'http://www.makersacademy.com'
    expect(Bookmark.all[1]).to include 'http://www.google.com'
    expect(Bookmark.all[2]).to include 'http://www.reddit.com'
  end
  
  it 'can add to a database' do
    Bookmark.create("http://www.makersacademy.com")
    expect(Bookmark.all[0]).to include 'http://www.makersacademy.com'
  end
# 
# it 'can update database entries' do
#
# end
# 
# it 'can delete database entries' do
#   
# end

end
