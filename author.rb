class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name:, last_name:)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.save
    authors = []
    all.each do |author|
      authors << {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name
      }
    end

    File.write('authors.json', JSON.pretty_generate(authors))
    'Authors saved to authors.json'
  end

  def self.load_authors
    return unless File.exist?('authors.json')

    authors_file = File.read('authors.json')
    authors = JSON.parse(authors_file)
    authors.each do |author|
      new(first_name: author['first_name'], last_name: author['last_name'])
    end
  end

  def self.display
    all.each do |author|
      puts "#{author.first_name} #{author.last_name}"
      puts '-----------------'
    end
  end
end
