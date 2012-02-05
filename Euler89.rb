#require 'benchmark'

class Euler89
	attr_accessor :arrOfRomans, :file, :arrOfIdeals, :arrOfRDigits, :arrOfValues
		# :nameOfMethod, :etc
	def initialize()
		@arrOfRomans = []
		@file = File.new("roman.txt", "r")  #Brings in the file\
		@hashOfRoman = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
		@hashOfSubRoman = {"IV"=>4, "IX" => 9, "XL" => 40, "XC" =>90, "CD"=>400, "CM"=>900}
		@hashOfTotalRoman = {"M"=>1000,"CM"=>900,"D"=>500,"CD"=>400,"C"=>100,"XC"=>90,"L"=>50,"XL"=>40,"X"=>10,"IX"=>9,"V"=>5,"IV"=>4,"I"=>1}
		while (line = @file.gets)  #Cycles through all the lines
			@arrOfRomans.push(line.chomp)  #Adds each line into arrOfRomans
		end  #endWhile
		@ArrOfIdeals = []
	end  #endDef
	def run()
		sumOfText = 0  #Roman numerals in the txt file
		sumOfPerfect = 0
		for roman in @arrOfRomans
			difference = roman.length - numIntoRoman(romanIntoNum(roman)).length
			#print difference
			sumOfText+=roman.length  #Roman in @arrOfRomans
			sumOfPerfect+=numIntoRoman(romanIntoNum(roman)).length  #add the length of the ideal roman.
		end
		print sumOfText-sumOfPerfect
	end
	
	def romanIntoNum(arg)
		value = 0
		@hashOfSubRoman.each do|roman,arabic|  #Goes through the hash of subtraction rule 
			while(arg.include?(roman))
				value+=arabic
				arg = arg.sub(roman,'')  #Delete the first instance of roman, and only the first
			end
		end
		@hashOfRoman.each do|roman,arabic|  #Goes through hash of actual romans
			while(arg.include?(roman))
				value+=arabic
				arg = arg.sub(roman,'')  #Delete the first instance of roman, and only the first
			end
		end
		return value
	end
	
	def numIntoRoman(num)
		returnRoman = ""
		@hashOfTotalRoman.each do|roman,arabic|  #Go through hash of all Romans, including subtraction
			while(arabic<=num)
				returnRoman = returnRoman + roman
				num-=arabic  # Subtract the arabic value from the argument
			end
		end
		return returnRoman	
	end
end

whatever = Euler89.new()
whatever.run()