require 'pg'

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

  def self.create(id, url)
    @@conn.exec( "INSERT INTO bookmarks VALUES (#{id}, '#{url}')")
  end

  
end
