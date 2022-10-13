require_relative 'genre'
require_relative 'item'
require 'json'

class MusicAlbum < Item
  attr_reader :on_spotify, :published_date, :genre

  def initialize(on_spotify:, published_date:, genre:)
    @on_spotify = on_spotify
    @published_date = published_date
    @genre = genre
    super(published_date: published_date)
  end

  def can_be_archived?
    super && on_spotify == true
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.save
    albums = []
    all.each do |album|
      albums << {
        id: album.id,
        on_spotify: album.on_spotify,
        genre: {
          id: album.genre.id,
          name: album.genre.name
        },
        published_date: album.published_date
      }
    end

    File.write('albums.json', JSON.pretty_generate(albums))
    'Albums saved successfully'
  end

  def self.load_albums
    return unless File.exist?('albums.json')

    albums_file = File.read('albums.json')
    albums = JSON.parse(albums_file)
    albums.each do |album|
      new(
        on_spotify: album['on_spotify'],
        genre: Genre.new(name: album['genre']['name']),
        published_date: album['published_date']
      )
    end
  end

  def self.display
    all.each do |album|
      puts "ID: #{album.id}"
      puts "Genre: #{album.genre.name}"
      puts "On Spotify: #{album.on_spotify}"
      puts "Published Date: #{album.published_date}"
      puts '_______________________________'
    end
  end
end
