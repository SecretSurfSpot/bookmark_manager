require 'pg'

class Bookmark

  def self.all
    # Code created by Mathilde and myself - replace by Code
    # from walkthrough
    # connection = PG.connect(dbname: 'bookmark_manager')
    # bookmarks = connection.exec "select url from bookmarks"
    # bookmarks.each do |row|
    #   row.each do |key, value|
    #     puts "#{value}"
    #   end
    # end

    # Code from walkthrough
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }


  end

end
