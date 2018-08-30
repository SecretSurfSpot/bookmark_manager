require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/save_url' do
    session[:url] = params[:url]
    Bookmark.create(session[:url])
    redirect '/confirmation'
  end

  get '/confirmation' do
    @url = session[:url]
    erb :confirmation
  end




  # Required if running from command line (ruby app.rb) and not using 'rackup'
  run! if app_file == $0

end
