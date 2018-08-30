require 'bookmark'
require 'pg'
require_relative 'spec_helper'
describe Bookmark do
  describe "#all" do
    it  "displays a list of all bookmarks" do
      #bookmarks = get_urls_from_bookmark_manager_test_database
      # Add test data into bookmarks table
      Bookmark.create('http://google.com')
      Bookmark.create('http://bbc.co.uk')
      Bookmark.create('http://facebook.com')

      bookmarks = Bookmark.all

      expect(bookmarks).to match_array(['http://google.com','http://bbc.co.uk','http://facebook.com'])
      expect(bookmarks).to include('http://google.com')
      expect(bookmarks).to include('http://bbc.co.uk')
      expect(bookmarks).to include('http://facebook.com')
    end
  end

  describe "#create" do
    it "adds a new bookmark" do
      saved_url = 'http://w3schools.com'
      Bookmark.create(saved_url)
      expect(Bookmark.all).to include(saved_url)
      expect(Bookmark.all).to match_array(['http://w3schools.com'])
    end
  end
end
