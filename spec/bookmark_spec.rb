require 'bookmark'
require 'pg'
require_relative 'spec_helper'
describe Bookmark do
  describe "#all" do
    it  "displays a list of all bookmarks" do

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

  describe "#validate" do
    it "validates a url" do
      saved_url = 'not_a_url'
      expect(Bookmark.validate(saved_url)).to eq nil
    end
  end
end
