# require 'pry'
#the language method takes the path to a text file and returns if the text is written in English, Gaelic or Spanish
#documening tests can be found in the spec directory
class WhatLang
  attr_accessor :path_to_file

  def language
    file = File.open(@path_to_file, "rb")
    contents = file.read
    input_words = contents.scan(/\w+/)
    scores = language_scores(input_words)
    result = language_result(scores).gsub(/_\d.txt/, '')
    if deviation(scores, result)
      "Text is written in #{result}"
    else
      "cannot identify language from our references, or input text is too short"
    end
  end

  def language_scores(input_words)
    scores = Hash.new(0)
    Dir.foreach('rep_files') do |item|
      next if item == '.' or item == '..'
      language_strings = File.open("rep_files/#{item}", "rb").read
      language_words = language_strings.scan(/\w+/)
      intersection = input_words & language_words
      language_score = intersection.size
      scores[item] = language_score
    end
    scores
  end

  def language_result(language_scores)
    largest_hash_key = language_scores.sort_by{|name, number| number}.last.first
  end

  def deviation(scores, result)
    result_language_files = scores.select {|k,v| k.match(result)}
    language_mean = mean_result(result_language_files)
    mean = mean_result(scores)
    return true if language_mean - mean > 5
  end

  def mean_result(result_language_files)
    arr = result_language_files.flatten.map {|x| Integer(x) rescue nil }.compact
    mean = (arr.inject(:+) / arr.size)
  end

end