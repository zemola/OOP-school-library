require_relative '../book'

describe Book do
  context 'When providing book information' do
    book = Book.new('Atoms', 'Ben')

    it 'creates a new book with title Atoms' do
      expect(book).to be_an_instance_of Book
    end
    it 'title of book should be Atoms' do
      expect(book.title).to eq 'Atoms'
    end

    it 'Author of book should be Ben' do
      expect(book.author).to eq 'Ben'
    end
  end
end
