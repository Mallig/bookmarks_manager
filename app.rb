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
    @id = params['id']
    Bookmark.create(@id, @url)
    redirect '/'
  end
  
end
