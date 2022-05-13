class Word
  attr_reader :id, :name
  @@words = {}
  @@id_count = 0

  def initialize(name, id)
    @name = name
    @id = id || @@id_count += 1
  end

  def self.all
    @@words.values()
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def self.clear
    @@words = {}
    @@id_count = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@words.delete(self.id)
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end

