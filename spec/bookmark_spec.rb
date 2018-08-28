require 'bookmark'
describe Bookmark do
  describe "#all" do
    it  "displays a list of all bookmarks" do
      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://google.com')
      expect(bookmarks).to include('http://bbc.co.uk')
      expect(bookmarks).to include('http://facebook.com')
    end
  end
end
