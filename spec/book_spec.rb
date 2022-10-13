require_relative './spec_helper'

describe Book do
  before(:each) do
    @label = Label.new(title: 'Avatar', color: 'Blue')
    @book = Book.new(publisher: 'Crunchyroll', cover_state: 'good', published_date: '18-03-2000', label: @label)
  end

  describe '#new' do
    context 'When creating a new book' do
      it 'should return a book object' do
        expect(@book).to be_an_instance_of Book
      end

      it 'should return a correct published_date' do
        expect(@book.published_date).to eq '18-03-2000'
      end

      it 'should return a correct publisher' do
        expect(@book.publisher).to eq 'Crunchyroll'
      end

      it 'should return a correct label' do
        expect(@book.label).to eq @label
      end
    end
  end
end
