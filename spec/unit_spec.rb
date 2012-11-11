require 'spec_helper'

describe WhatLang do

  before(:each) do
    @what_lang = WhatLang.new
  end
  
  describe "mean_result" do
    it "should return the correct mean from a hash" do
      h = {"a"=>28, "b"=>21, "c"=>16}
      @what_lang.mean_result(h).should == 21
    end
  end

  describe "deviation" do
    it "should return the true if the deviation is over the threshold" do
      h =  { "a_1.txt"=>28,
             "a_2.txt"=>21,
             "a_3.txt"=>16,
             "b_1.txt"=>6,
             "b_2.txt"=>9,
             "b_3.txt"=>7,
             "d_1.txt"=>7,
             "d_2.txt"=>6,
             "d_3.txt"=>3
           }
      @what_lang.deviation(h,"a").should == true
    end

    it "should return the true if the deviation is over the threshold" do
      h =  { "a_1.txt"=>6,
             "a_2.txt"=>7,
             "a_3.txt"=>5,
             "b_1.txt"=>6,
             "b_2.txt"=>9,
             "b_3.txt"=>7,
             "d_1.txt"=>7,
             "d_2.txt"=>6,
             "d_3.txt"=>3
           }
      @what_lang.deviation(h,"a").should == nil
    end
  end

  describe "language_result" do
    it "should return the key of the highest hash element" do
    h =  { "a_1.txt"=>6,
           "a_2.txt"=>21,
           "a_3.txt"=>5,
       }
    @what_lang.language_result(h).should == "a_2.txt"
    end
  end

end