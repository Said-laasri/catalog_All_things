require_relative 'game'
require_relative 'author'
require_relative 'book'
require_relative 'label'
require_relative 'music_album'
require_relative 'genre'

class App
  def self.list_books
    Book.display
  end

  def self.list_music_albums
    MusicAlbum.display
  end

  def self.list_games
    Game.display
  end

  def self.add_music_album
    puts 'Add Music Album to library'
    print 'Enter Genre: '
    genre = gets.chomp
    genre = Genre.new(name: genre)
    print 'Enter On Spotify [true or false]: '
    on_spotify = gets.chomp.downcase == 'true'
    print 'Enter publish date: '
    published_date = gets.chomp
    MusicAlbum.new(on_spotify: on_spotify, published_date: published_date, genre: genre)
    puts 'Music Album added successfully'
  end

  def self.add_book
    puts 'Add book to library'
    print 'Enter Label: '
    label = gets.chomp
    label = Label.new(title: label)
    print 'Enter Publisher: '
    publisher = gets.chomp
    print 'Enter publish date: '
    published_date = gets.chomp
    print 'Cover State: '
    cover_state = gets.chomp
    Book.new(publisher: publisher, published_date: published_date, cover_state: cover_state, label: label)
    puts 'Book added successfully'
  end

  def self.add_game
    puts 'Add Game to library'
    print 'Enter First Name of the Author: '
    first_name = gets.chomp
    print 'Enter Last Name of the Author: '
    last_name = gets.chomp
    author = Author.new(first_name: first_name, last_name: last_name)
    print 'Enter The Name of the Game: '
    name = gets.chomp
    print 'Enter Multiplayer [true or false]: '
    multiplayer = gets.chomp.downcase == 'true'
    print 'Enter Last Played At: '
    last_played_at = gets.chomp
    print 'Enter publish date: '
    published_date = gets.chomp
    Game.new(name: name, multiplayer: multiplayer, last_played_at: last_played_at, published_date: published_date,
             author: author)
    puts 'Game added successfully'
  end

  def self.list_all_genres
    Genre.display
  end

  def self.list_all_labels
    Label.display
  end

  def self.list_all_authors
    Author.display
  end

  def self.save_and_exit
    Game.save
    Author.save
    Book.save
    Label.save
    MusicAlbum.save
    Genre.save
    puts 'Saved All Data Successfully!'
    puts 'See You Next Time!'
    exit
  end
end
