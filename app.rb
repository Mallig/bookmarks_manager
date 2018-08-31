require 'sinatra/base'
require './lib/bookmark'
require 'pg'
require 'sinatra/flash'


class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end
  
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end
  
  post '/save_bookmark' do
    flash[:notice] = "Invalid URL" unless Bookmark.create(params['url'])
    redirect '/'
  end

end
