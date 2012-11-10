require 'spec_helper'

describe WhatLang do
	# before :each do
	# 	@what_lang = WhatLang.new
	# 	@what_lang.path_to_file = path_to_file
	# end
	it "should return English as the langauge of the text" do
		path_to_file = "english_example.txt"
		what_lang = WhatLang.new
		what_lang.path_to_file = path_to_file
		what_lang.language.should == "Text is written in english"
  end

  it "should return Spanish as the langauge of the text" do
		path_to_file = "spanish_example.txt"
		what_lang = WhatLang.new
		what_lang.path_to_file = path_to_file	
		what_lang.language.should == "Text is written in spanish"
  end

   it "should return Gaelic as the langauge of the text" do
		path_to_file = "gaelic_example.txt"
		what_lang = WhatLang.new
		what_lang.path_to_file = path_to_file
		what_lang.language.should == "Text is written in gaelic"
  end

  # it "should return an exception message if the language cannot be identified" do
  # end

  # it "should return an exception if the file does not exist or is empty" do
  # end

  # TODO:
  # the punctuations, etc
  # ngrams?
  # readme file


end