require 'rspec'
require 'word'
require 'definition'

describe(".all") do 
  it("returns an empty array when there are no words") do
    expect(Word.all).to(eq([]))
  end
end

describe("#==") do
  it("is the same word if it gas the same attributes as another word") do
    word = Word.new("hello", nil)
    word2 = Word.new("hello", nil)
    expect(word).to(eq(word2))
  end
end