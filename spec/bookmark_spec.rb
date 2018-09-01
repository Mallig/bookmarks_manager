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

  describe '.all' do
    it 'lists saved bookmarks' do
      add_test_bookmarks
      expect(Bookmark.all[0].title).to eq 'Makers Academy'
      expect(Bookmark.all[1].title).to eq 'Google'
      expect(Bookmark.all[2].title).to eq 'Reddit'
    end
  end

  describe '.create' do
    it 'adds a bookmark to database' do
      example_bookmark = Bookmark.create("http://www.makersacademy.com", "Makers Academy")
      
      expect(example_bookmark).to be_a Bookmark
      expect(example_bookmark.title).to eq 'Makers Academy'
      expect(example_bookmark.url).to eq 'http://www.makersacademy.com'
    end
  end 


end
