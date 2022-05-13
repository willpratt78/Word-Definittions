class Definition
  attr_reader :id
  attr_accessor :name, :word_id

  @@defitnions = {}
  @@id_count = 0

  def initialize(name, word_id, id)
    @name = name
    @word_id = word_id
    @id = id || @@id_count += 1
  end

  def save
    @@defitnions[self.id] = Definition.new(self.name, self.word_id, self.id)
  end
end