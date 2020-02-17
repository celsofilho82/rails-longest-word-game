require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(9)
  end

  def score
    @attempt = params[:letter]
    @words = params[:letters]
    letters = @words.split()
    url = "https://wagon-dictionary.herokuapp.com/#{@attempt}"
    word_serialize = open(url).read
    word = JSON.parse(word_serialize)
    teste = check_in_array letters, word["word"]
    raise
  end

  def check_in_array(array, word)
    words = word.split("")
    return true if words.all? { |i| array.include?(i) }
  end

end
