require 'rspec'
require 'word'
require 'definition'

describe('#Word') do
  
  before(:each) do
    Word.clear()
  end


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

  describe("#save") do
    it("saves a word") do
      word = Word.new("hello", nil)
      word.save()
      word2 = Word.new("goodbye", nil)
      word2.save
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("hello", nil)
      word.save()
      word2 = Word.new('goodbye', nil)
      word2.save()
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe(".find") do 
    it("finds a word by id") do
      word = Word.new("hello", nil)
      word.save()
      word2 = Word.new("goodbye", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe("#update") do
    it("updates a word by id") do
      word = Word.new("hello", nil)
      word.save()
      word.update("goofy")
      expect(word.name).to(eq("goofy"))
    end
  end

  describe("#delete") do 
    it("deletes a word by id") do
      word = Word.new("hello", nil)
      word.save()
      word2 = Word.new("goodbye", nil)
      word2.save()
      word2.delete()
      expect(Word.all).to(eq([word]))
    end
  end
end

