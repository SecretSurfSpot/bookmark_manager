require 'pg'

feature 'viewing bookmarks' do
  scenario 'user visits homepage and sees bookmarks' do

    # Add test data into bookmarks table
    Bookmark.create(url: 'http://google.com', title: 'Google')
    Bookmark.create(url: 'http://bbc.co.uk/sport', title: 'BBC-Sport')
    Bookmark.create(url: 'http://facebook.com', title: 'Facebook')
    visit ('/bookmarks')
    # expect(page).to have_content ('http://google.com', 'Google')
    # expect(page).to have_content ('http://bbc.co.uk/sport', 'BBC-Sport')
    # expect(page).to have_content ('http://facebook.com', 'Facebook')
  end
end

feature 'add new bookmark' do
  scenario 'user can add a bookmark to bookmark manager' do
    visit '/add'
    fill_in('url', with: 'http://w3schools.com')
    fill_in('title', with: 'W3Schools')
    click_button 'Save'
    expect(page).to have_link('W3Schools', href: 'http://w3schools.com')
    expect(page).to have_content('W3Schools')
    # expect(page).to have_content "http://w3schools.com"
  end
end

feature 'validate url' do
  scenario 'an error is raised when a user enters an incorrect url' do
    visit '/add'
    fill_in('url', with: 'not_a_url')
    click_button 'Save'
    expect(page).to have_content "Invalid url entered, please enter a valid url"
  end
end
