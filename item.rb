require 'date'

class Item
  attr_reader :id
  attr_accessor :published_date, :archived

  def initialize(published_date:, archived: false)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    published_year = Date.strptime(@published_date, '%d-%m-%Y').strftime('%Y')
    Time.now.year - published_year.to_i > 10
  end

  private :can_be_archived?

  def move_to_archived?
    can_be_archived? == true
  end

  def genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
end
