require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Hello world"
    erb :index
  end



  # Required if running from command line (ruby app.rb) and not using 'rackup'
  run! if app_file == $0

end
