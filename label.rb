class Label
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(title:, color: 'Red')
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.save
    labels = []
    all.each do |label|
      labels << {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end

    File.write('labels.json', JSON.pretty_generate(labels))
    'Labels saved to labels.json'
  end

  def self.load_labels
    return unless File.exist?('labels.json')

    labels_file = File.read('labels.json')
    labels = JSON.parse(labels_file)
    labels.each do |label|
      new(title: label['title'])
    end
  end

  def self.display
    all.each do |label|
      puts label.title.to_s
      puts '-----------------'
    end
  end
end
