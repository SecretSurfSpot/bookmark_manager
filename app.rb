require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/bookmarks'
  end
  
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/add' do
    erb :add
  end

  post '/save_url' do
    session[:url] = params[:url]
    if Bookmark.validate(session[:url])
      Bookmark.create(session[:url])
      redirect '/bookmarks'
    else
      flash[:error] = "Invalid url entered, please enter a valid url"
    end
  end

  # Required if running from command line (ruby app.rb) and not using 'rackup'
  run! if app_file == $0

end
