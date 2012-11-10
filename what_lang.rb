require 'pry'

class WhatLang
	attr_accessor :path_to_file

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

  def language
    file = File.open(@path_to_file, "rb")
    contents = file.read
		input_words = contents.scan(/\w+/)
		scores = language_scores(input_words)
    result = "Text is written in #{language_result(scores).gsub(/_\d.txt/, '')}"
	end

	# standard_deviation between all the file occurances
	# standard_deviation between each language

end
  
	# path_to_file = "english_example.txt"
	# what_lang = WhatLang.new
	# what_lang.path_to_file = path_to_file
	# puts what_lang.language