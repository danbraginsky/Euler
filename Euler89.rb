#require 'benchmark'

class Euler89
	attr_accessor :arrOfRomans, :file, :arrOfIdeals, :arrOfRDigits, :arrOfValues
		# :nameOfMethod, :etc
	def initialize()
		@arrOfRomans = []
		@file = File.new("roman.txt", "r")  #Brings in the file\
		@hashOfRoman = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
		@hashOfValue = {1=>"I", 5=>"V", 10=>"X", 50=>"L", 100=>"C", 500=>"D",1000=>"M"}
		@hashOfSRoman = {"IV"=>4, "IX" => 9, "XL" => 40, "XC" =>90, "CD"=>400, "CM"=>900}
		@hashOfSValue = {4=>"IV", 9=>"IX", 40=>"XL", 90=>'XC', 400=>'CD', 900=>'CM'}
		while (line = @file.gets)  #Cycles through all the lines
			@arrOfRomans.push(line)  #Adds each line into arrOfRomans
		end  #endWhile
		@ArrOfIdeals = []
	end  #endDef

	def romanIntoNum(arg)
		value = 0
		@hashOfSRoman.each do|roman,arabic|
			if(arg.include?(roman))
				value+=arabic
				arg = arg.delete(roman)
			end
		end
		
		@hashOfRoman.each do|roman,arabic|
			if(arg.include?(roman))
				value+=arabic
				arg = arg.delete(roman)
			end
		end
		print value, "\n"
	end
	
	def numIntoRoman(num)
		
	end
end

whatever = Euler89.new()
whatever.romanIntoNum("MIV")
# print whatever.romanIntoNum("VI"), "\n"
# print whatever.idealRoman(6)