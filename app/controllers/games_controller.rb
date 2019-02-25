require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score
    @word = params[:score]
    if validation?(@word)
      then @score = parse(@word)
    else
      @score = "You used the wrong letters, that's nonsense..."
    end
  end

  def validation?(keyword)
    validation = true
    word_chars = keyword.upcase.chars
    word_chars.each do |letter|
      if word_chars.select { |let| let == letter }.uniq != params[:letters].chars.select { |let| let == letter }.uniq
        then validation = false
      end
    end
    validation
  end

  def parse(keyword)
    url = "https://wagon-dictionary.herokuapp.com/#{keyword}"
    result = JSON.parse(open(url).read)
    result['found'] ? @score = result['length'] : @score = "Good try but it doesn't exist, and you knew it"
  end
end
