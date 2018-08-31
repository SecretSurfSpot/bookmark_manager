require 'bookmark'
require 'pg'
require_relative 'spec_helper'
describe Bookmark do
  describe ".all" do
    it  "displays a list of all bookmarks" do

      # Add test data into bookmarks table
      Bookmark.create(url: "http://google.com", title: "Google")
      Bookmark.create(url: "http://bbc.co.uk/sport", title: "BBC-Sport")
      Bookmark.create(url: "http://facebook.com", title: "Facebook")

      bookmarks = Bookmark.all
      bookmark = Bookmark.all.first

      p bookmarks

      expect(bookmarks.length).to eq 3
      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq 'Google'
      expect(bookmark.url).to eq 'http://google.com'

    #  expect(bookmarks).to match_array(['http://google.com','http://bbc.co.uk','http://facebook.com'])
      # expect(bookmarks).to include('http://google.com')
      # expect(bookmarks).to include('http://bbc.co.uk/sport')
      # expect(bookmarks).to include('http://facebook.com')
    end
  end

  describe ".create" do
    it "adds a new bookmark" do
      saved_url = 'http://w3schools.com'
      saved_title = 'W3Schools'
      bookmark = Bookmark.create(url: saved_url, title: saved_title)

      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq 'W3Schools'

      # bookmark = Bookmark.all.first
      #
      # expect(Bookmark.all).to include(saved_url)
      # expect(Bookmark.all).to match_array(['http://w3schools.com'])
    end
  end

  describe ".validate" do
    it "validates a url" do
      saved_url = 'not_a_url'
      expect(Bookmark.validate(saved_url)).to eq nil
    end
  end
end
