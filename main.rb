require_relative 'app'
require_relative 'book'
require_relative 'label'
require_relative 'music_album'
require_relative 'genre'
require_relative 'game'
require_relative 'author'

puts 'Welcome to Catalog of my things'
puts ' '

def main
  loop do
    puts 'Please choose an option by entering a number'
    puts ' 1 - List all Books'
    puts ' 2 - Add a Book'
    puts ' 3 - List all Music Albums'
    puts ' 4 - Add a Music Album'
    puts ' 5 - List all Games'
    puts ' 6 - Add a Game'
    puts ' 7 - List all Labels (Gift, New)'
    puts ' 8 - List all Genres (Comedy, Thriller)'
    puts ' 9 - List all Authors (Stephen King)'
    puts '10 - Save and Exit'
    option = gets.chomp.to_i
    select = Selection.new
    select.select_method(option)
    select.select_extra_method(option)
    select.abort_method(option)
  end
end

class Selection
  def select_method(option)
    case option
    when 1
      App.list_books
    when 2
      App.add_book
    when 3
      App.list_music_albums
    when 4
      App.add_music_album
    when 5
      App.list_games
    when 6
      App.add_game
    end
  end

  def select_extra_method(option)
    case option
    when 7
      App.list_all_labels
    when 8
      App.list_all_genres
    when 9
      App.list_all_authors
    end
  end

  def abort_method(option)
    App.save_and_exit unless option != 10
  end
end

def load_data
  Book.load_books
  Label.load_labels
  MusicAlbum.load_albums
  Genre.load_genres
  Game.load_games
  Author.load_authors
end

load_data
main
