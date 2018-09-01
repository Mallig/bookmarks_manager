def add_test_bookmarks
  conn = PG.connect( :dbname => 'bookmark_manager_test' )

  Bookmark.create('http://www.makersacademy.com', 'Makers Academy')
  Bookmark.create('http://www.google.com', 'Google')
  Bookmark.create('http://www.reddit.com', 'Reddit')

# conn.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy')")
# conn.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google')")
# conn.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.reddit.com', 'Reddit')")
end
