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
    
  end

end