require 'pg'
require 'uri'

class Bookmark
  attr_reader :id, :url, :title

  @@db = "bookmark_manager#{ '_test' if ENV['RACK_ENV'] == 'test' }"
  @@conn = PG.connect( :dbname => @@db )
  
  # *** INSTANCE METHODS ***

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  # *** CLASS METHODS ***

  def self.db
    @@db
  end

  def self.conn
    @@conn
  end

  def self.all
    # @@conn or conn ?
    rs = @@conn.exec( "SELECT * FROM bookmarks;" )
    rs.map do |bookmark|
      Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title'])
    end
  end

  def self.create(url, title)
    return false unless valid_url?(url)
    rs = @@conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')
                      RETURNING id, url, title;")
    Bookmark.new(rs[0]['id'], rs[0]['url'], rs[0]['title'])
  end

  private

  def self.valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
  
end
