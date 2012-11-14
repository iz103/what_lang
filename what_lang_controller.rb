require_relative 'what_lang'
class WhatLangController < WhatLang
  require "highline/import"
  begin
    path_to_file = ask("path to file you wish to identify? "){|q| q.validate = /.txt/ }
      
    what_lang = WhatLang.new
    what_lang.path_to_file = path_to_file
    puts what_lang.language
  end

end