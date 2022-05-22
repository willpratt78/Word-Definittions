require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a  word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'hello')
    click_on('Go!')
    expect(page).to have_content('hello')
  end
end

describe('create a defintion path', {:type => :feature}) do
  it('creates a defintion and then goes to the defintion page') do
    word = Word.new("hello", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'a greeting')
    click_on('Add definition')
    expect(page).to have_content('a greeting')
  end
end

describe('update a word', {:type => :feature}) do
  it('updates a word and then goes to words page') do
    word = Word.new("hello", nil)
    word.save
    visit("/words/#{word.id}/edit")
    fill_in("name", :with => "goodbye")
    click_on('Update')
    expect(page).to have_content('goodbye')
  end
end

describe('delete a word', {:type => :feature}) do
  it('deletes a word and then goes to words page') do
    word = Word.new("phone", nil)
    word.save
    visit("/words/#{word.id}/edit")
    click_on('Delete word')
    expect(page).not_to have_content('phone')
  end
end

describe('update a definition', {:type => :feature}) do
  it('updates a definition then goes to the word page') do
    word = Word.new("hello", nil)
    word.save
    definition = Definition.new("a greeting", word.id, nil)
    definition.save
    visit("/words/#{word.id}/definitions/#{definition.id}")
    fill_in("name", :with => "a way to greet someone")
    click_on('Update definition')
    expect(page).to have_content('a way to greet someone')
  end
end