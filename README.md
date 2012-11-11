READ ME

Description:

The WhatLang class determines if an  input text is in either English, Gaelic (Irish) or Spanish.  If the the input text is in another language, other than the aforementioned, ot the input text is too short to make a match, the class will return an fail message.

The program does so by comparing the input to a selection of reference texts written in English, Gaelic and Spanish.  It parses the input text into an array of words and compares this to arrays generate from the reference texts.  The referece texts with the highest number of matches to the input text array indicates a language match.  

However, to reduce false positives, the program selects all the files that represent the language with the highest match, takes an number of matches and compares it to the avergae number of matches across all reference files.  If the difference in averages in greater than an arbitraty value of 5, this idicates a good probability that a correct match is found.  If the input text is too short to prodice a significant differences in averge matches, this lowers the probablility of a correct match.  The arbitrary value of 5 is subject to change according to the size of the reference texts, and experience in language differences.

Instructions



Suggestions for Further Refinement



  # TODO:
  # the punctuations, etc
  # ngrams?




	# path_to_file = "english_example.txt"
	# what_lang = WhatLang.new
	# what_lang.path_to_file = path_to_file
	# puts what_lang.language