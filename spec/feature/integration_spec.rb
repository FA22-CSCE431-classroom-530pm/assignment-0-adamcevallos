# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'can change input field' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Title', with: 'lord of the rings'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('lord of the rings')
  end

  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K Rowling'
    fill_in 'Price', with: 5.99
    fill_in 'Date_Published', with: Date.new(1997, 6, 26)
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

end