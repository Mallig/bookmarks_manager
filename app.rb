require 'sinatra/base'
require './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post '/save_bookmark' do
    @url = params['url']
    @id = rand(1..100) #bad mal, change this
    @conn = PG.connect( dbname: "bookmark_manager#{ '_test' if ENV['RACK_ENV'] == 'test'}" )
    @conn.exec( "INSERT INTO bookmarks VALUES (#{@id}, '#{@url}')" )
    redirect '/'
  end
end
