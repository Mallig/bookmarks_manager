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
end
