#require 'benchmark'

class Euler89
	attr_accessor :arrOfRomans, :file, :arrOfIdeals, :arrOfRDigits, :arrOfValues
		# :nameOfMethod, :etc
	def initialize()
		@arrOfRomans = []
		@file = File.new("roman.txt", "r")  #Brings in the file\
		@hashOfRoman = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
		#@hashOfValue = {1=>"I", 5=>"V", 10=>"X", 50=>"L", 100=>"C", 500=>"D",1000=>"M"}
		@hashOfSubRoman = {"IV"=>4, "IX" => 9, "XL" => 40, "XC" =>90, "CD"=>400, "CM"=>900}
		#@hashOfSubValue = {4=>"IV", 9=>"IX", 40=>"XL", 90=>'XC', 400=>'CD', 900=>'CM'}
		@hashOfTotalRoman = {"M"=>1000,"CM"=>900,"D"=>500,"CD"=>400,"C"=>100,"XC"=>90,"L"=>50,"XL"=>40,"X"=>10,"IX"=>9,"V"=>5,"IV"=>4,"I"=>1}
		while (line = @file.gets)  #Cycles through all the lines
			@arrOfRomans.push(line)  #Adds each line into arrOfRomans
		end  #endWhile
		@ArrOfIdeals = []
	end  #endDef
	def run()
		sumOfText = 0
		sumOfPerfect = 0
		for roman in @arrOfRomans
			sumOfText+=roman.length
			sumOfPerfect+=numIntoRoman(romanIntoNum(roman)).length
		end
		print sumOfText-sumOfPerfect
	end
	
	def romanIntoNum(arg)
		value = 0
		@hashOfSubRoman.each do|roman,arabic|
			while(arg.include?(roman))
				value+=arabic
				arg = arg.sub(roman,'')
			end
		end
		@hashOfRoman.each do|roman,arabic|
			while(arg.include?(roman))
				value+=arg.count(roman)*arabic
				arg = arg.delete!(roman)
			end
		end
		return value
	end
	
	def numIntoRoman(num)
		returnRoman = ""
		@hashOfTotalRoman.each do|roman,arabic|
			while(arabic<=num)
				returnRoman = returnRoman + roman
				num-=arabic
			end
		end
		return returnRoman	
		#print returnRoman
	end
end

whatever = Euler89.new()
whatever.run()