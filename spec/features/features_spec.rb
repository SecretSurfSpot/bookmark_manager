require 'pg'

feature 'viewing bookmarks' do
  scenario 'user visits homepage and sees bookmarks' do

    # Add test data into bookmarks table
    Bookmark.create('http://google.com')
    Bookmark.create('http://bbc.co.uk')
    Bookmark.create('http://facebook.com')
    visit ('/')
    expect(page).to have_content 'http://google.com'
    expect(page).to have_content 'http://bbc.co.uk'
    expect(page).to have_content 'http://facebook.com'
  end
end

feature 'add new bookmark' do
  scenario 'users visits add page and can add a new URL' do
    visit '/add'
    fill_in('url', with: 'http://w3schools.com')
    click_button 'Save'
    expect(page).to have_content "http://w3schools.com"
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
