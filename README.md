###READ ME

###Description

The program determines if an input text is in either English, Gaelic (Irish) or Spanish.  If the the input text is in another language, other than the aforementioned, or the input text is too short to make enough matches, the class will return a failure message.

The program does so by comparing the input to a selection of reference texts written in English, Gaelic and Spanish.  It parses the input text and inserts individual words into an array, comparing this to arrays generated from reference texts.  The referece texts with the highest number of unique matches to the input text array indicates a language match.  

However, to reduce false positives, the program selects all the files that represent the language with the highest match, takes an average of number of matches and compares it to the avergae number of matches across all reference files.  If the difference in averages is greater than an arbitraty value of 5, this idicates a good probability that a correct match is found.  If the input text is too short to produce significant differences in averge matches, this lowers the probablility of a correct match.  The arbitrary value of 5 is subject to change according to the size of the reference texts, and experience in language differences.

###Code Structure and programming style

The code demonstrates the ability to compare parsed text and utilise simple statistical measures to ensure a reasonably accurate language identification.

All the logic is included in one class (WhatLang).  The only other class is the WhatLangController, which inherits from WhatLang. Is a simple interface layer for the user to input a path to a txt file, in the terminal.

Within the WhatLang class, the only public method is "language".  All other methods are called from "language" and are therefore private.  However all methods are unit tested, hence, @object.send is used to test the private methods.

Rspec is used for testing.  Both a simple integration test and unit tests are written.

###Instructions

- To run the spec file, cd into the project directory and run:

rspec spec

- Or from the terminal cd into the program root directory. Run "ruby what_lang_controller.rb". Follow the instructions in the prompt.

###Required Dependencies
  Ruby 1.9.3
  gems:
	Rspec
	pry for debugging
	Highline, for user input

###Suggestions for Further Improvement

To increase accuracy of the results the following suggestions are made:

- Use larger language reference files, or a higher number of language reference files for comparison.

- construct n-grams of the refercne text (unigrams, bigrams and trigrams).  Also, produce n-grams of the referece text. The matches between reference language n-grams and input text n-grams would be of a higher quality (compared to single words, as used in this program).

Producing n-grams may slow processing down, since it dramatically increases the size of the data structure.  To mitigate, use bloom filters to store the n-grams (bloomfilter-rb gem is a library that can be used).