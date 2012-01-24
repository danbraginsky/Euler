#require 'benchmark'

class Euler89
	attr_accessor :arrOfRomans, :file, :arrOfIdeals, :arrOfRDigits, :arrOfValues
		# :nameOfMethod, :etc
	def initialize()
		@arrOfRomans = []
		@file = File.new("roman.txt", "r")  #Brings in the file
		@arrOfRDigits = ["I", "V", "X", "L", "C", "D", "M"]
		@arrOfValues = [1, 5, 10, 50, 100, 500, 1000]
		while (line = @file.gets)  #Cycles through all the lines
			@arrOfRomans.push(line)  #Adds each line into arrOfRomans
		end  #endWhile
		@ArrOfIdeals = []
	end  #endDef
	
	def romanIntoNum(roman)
		i = 0
		value = 0
		lastNum = roman[0]
		while i < roman.length
			if (@arrOfRDigits.index(roman[i]) 
			value+=@arrOfValues[@arrOfRDigits.index(roman[i])]
			i+=1
		end
		return value
	end
	
	def idealRoman(int)
		
	end
end

whatever = Euler89.new()
print whatever.romanIntoNum("MXV")