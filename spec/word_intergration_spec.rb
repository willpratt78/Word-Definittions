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