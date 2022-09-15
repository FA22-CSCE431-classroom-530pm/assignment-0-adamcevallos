# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'jk rowling'
    fill_in 'Price', with: 5.99
    fill_in 'book[published_date]', with: Date.new(1997, 6, 26)
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('jk rowling')
    expect(page).to have_content(5.99)
    expect(page).to have_content(Date.new(1997, 6, 26))
  end

  scenario 'can change input field' do
    visit new_book_path
    fill_in 'Title', with: 'lord of the rings'
    fill_in 'Author', with: 'jk rowling'
    fill_in 'Price', with: 5.99
    fill_in 'book[published_date]', with: Date.new(1997, 6, 26)
    fill_in 'Title', with: 'harry potter'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

end