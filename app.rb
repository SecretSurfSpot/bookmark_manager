require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  # Required if running from command line (ruby app.rb) and not using 'rackup'
  run! if app_file == $0

end
