require 'json'

class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name:)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.save
    genres = []
    all.each do |genre|
      genres << {
        id: genre.id,
        name: genre.name
      }
    end

    File.write('genres.json', JSON.pretty_generate(genres))
    'Genres saved to genres.json'
  end

  def self.load_genres
    return unless File.exist?('genres.json')

    genres_file = File.read('genres.json')
    genres = JSON.parse(genres_file)
    genres.each do |genre|
      new(name: genre['name'])
    end
  end

  def self.display
    all.each do |genre|
      puts genre.name.to_s
      puts '-----------------'
    end
  end
end
