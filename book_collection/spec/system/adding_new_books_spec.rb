require 'rails_helper'

RSpec.describe "AddingNewBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'adding a new book' do
    visit '/books/new'
    fill_in 'Title', with: 'Hello!'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')
    book = Book.order("id").last
    expect(book.title).to eq('Hello!')
  end

  it 'preventing empty books' do
    visit '/books/new'
    fill_in 'Title', with: ''
    click_on 'Create Book'
    expect(page).to have_content('Failed to create book. No input given.')
  end
end

# RSpec.describe "AddingNewBooks", type: :model do
#   context 'validations' do
#     it 'book requires a title' do
#       book = Book.new
#       expect(book).to_not be_valid
#       expect(book.errors[:title]).to include("can't be blank")
#     end
#   end
# end
