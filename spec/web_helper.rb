def clear_test_database
  conn = PG.connect( :dbname => 'bookmark_manager_test' )
  conn.exec('TRUNCATE bookmarks')
end

def add_test_bookmarks
  conn = PG.connect( :dbname => 'bookmark_manager_test' )
  conn.exec("INSERT INTO bookmarks VALUES (1, 'www.makersacademy.com')")
  conn.exec("INSERT INTO bookmarks VALUES (2, 'www.google.com')")
  conn.exec("INSERT INTO bookmarks VALUES (3, 'www.reddit.com')")
end
