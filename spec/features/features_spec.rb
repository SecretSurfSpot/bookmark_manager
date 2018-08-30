require 'pg'

feature 'viewing bookmarks' do
  scenario 'user visits homepage and sees bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1,'http://google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2,'http://bbc.co.uk');")
    connection.exec("INSERT INTO bookmarks VALUES(3,'http://facebook.com');")
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
    expect(page).to have_content "You've just added: http://w3schools.com"
  end
end
