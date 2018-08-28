feature 'bookmark list' do
  scenario 'user visits homepage and sees bookmarks' do
    visit '/'
    expect(page).to have_content 'http://google.com'
    expect(page).to have_content 'http://bbc.co.uk'
    expect(page).to have_content 'http://facebook.com'
  end
end
