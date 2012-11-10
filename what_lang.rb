require 'pry'

  # def gaelic_score(input_words)
  # 	gaelic_string = File.open("rep_files/gaelic_1.txt", "rb").read
		# gaelic_words = gaelic_string.scan(/\w+/)
		# intersection = input_words & gaelic_words
		# gaelic_score = intersection.size
  # end

  # def english_score(input_words)
  # 	english_string = File.open("rep_files/english_1.txt", "rb").read
		# english_words = english_string.scan(/\w+/)
		# intersection = input_words & english_words
		# english_score = intersection.size
  # end

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
    binding.pry
  end

  def language_result(results)
  	results.max.first.to_s
  end

  def language(path_to_file)
    file = File.open("gaelic_example.txt", "rb")
    contents = file.read
		input_words = contents.scan(/\w+/)

		language_scores(input_words)
		# gaelic_score(input_words)
		# spanish_score(input_words)
	end
 
   
	path_to_file = "spanish_example.txt"
  language(path_to_file)

