require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  describe('#save') do 
    it('saves a definition') do
      definition = Definition.new("a defitnion", @word.id, nil)
      definition.save()
      expect(Defintion.all).to(eq([definition]))
    end
  end
end