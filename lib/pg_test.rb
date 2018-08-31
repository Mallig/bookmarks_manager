require 'pg'

class PostGress
  attr_reader :conn

  def initialize()
    @conn = PG.connect( :dbname => 'bookmark_manager')
  end

  def insert(id, url)
    conn.exec( "INSERT INTO bookmarks VALUES(#{id}, #{url})")
    conn.close
  end

end

# postgres = PostGress.new
# id = gets.chomp
# url = gets.chomp
# postgres.insert(id, url)
