require 'pg'

def setup_test_database

  p 'setting up database...'

  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear all existing records in bookmarks table
  connection.exec('TRUNCATE bookmarks;')
  
end
