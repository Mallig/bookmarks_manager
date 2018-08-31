require 'pg'
require 'uri'

class Bookmark

  @@db = "bookmark_manager#{ '_test' if ENV['RACK_ENV'] == 'test' }"
  @@conn = PG.connect( :dbname => @@db )
  
  def self.db
    @@db
  end

  def self.conn
    @@conn
  end

  def self.all
    # @@conn or conn ?
    rs = @@conn.exec( "SELECT * FROM bookmarks ORDER BY id;" )
    rs.map { |row| "%s %s" % [ row['id'], row['url'] ] }
  end

  def self.create(url)
    return false unless valid_url?(url)
    @@conn.exec( "INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end

  private

  def self.valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
  
end
