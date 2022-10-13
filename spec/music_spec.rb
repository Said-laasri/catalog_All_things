require_relative './spec_helper'

describe MusicAlbum do
  before(:each) do
    @genre = Genre.new(name: 'Rock')
    @music_album = MusicAlbum.new(on_spotify: true, published_date: '18-03-2000', genre: @genre)
  end

  describe '#new' do
    context 'When creating a new music_album' do
      it 'should return a music_album object' do
        expect(@music_album).to be_an_instance_of MusicAlbum
      end

      it 'should return a correct published_date' do
        expect(@music_album.published_date).to eq '18-03-2000'
      end

      it 'should return a correct on_spotify' do
        expect(@music_album.on_spotify).to eq true
      end

      it 'should return a correct genre' do
        expect(@music_album.genre).to eq @genre
      end
    end
  end
end
