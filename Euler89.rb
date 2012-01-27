#require 'benchmark'

class Euler89
	attr_accessor :arrOfRomans, :file, :arrOfIdeals, :arrOfRDigits, :arrOfValues
		# :nameOfMethod, :etc
	def initialize()
		@arrOfRomans = []
		@file = File.new("roman.txt", "r")  #Brings in the file\
		@arrOfRoman = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "C" => 100, "D" => 500, "M" => 1000}
		@arrOfValue = {1=>"I", 5=>"V", 10=>"X", 50=>"L", 100=>"C", 500=>"D", 1000=>"M"}
		while (line = @file.gets)  #Cycles through all the lines
			@arrOfRomans.push(line)  #Adds each line into arrOfRomans
		end  #endWhile
		@ArrOfIdeals = []
	end  #endDef
	
	def romanIntoNum(arg)
		i = 0
		value = 0
		lastNum = arg[0]
		while i < arg.length
			if (@arrOfRDigits.index(arg[i]) >= @arrOfRDigits.index(lastNum))
				print 'Yay', "\n"
			end
			value+=@arrOfValues[@arrOfRDigits.index(arg[i])]
			i+=1
		end
		return value
	end
	
	def idealRoman(int)
		roman = ''
		while int > 0
			for ss in @arrOfRoman
				if (ss > int)
					print 'happy'
					#print @arrOfValue.keys[ss - 1]
				end
			end
		end
		return roman
	end
end

whatever = Euler89.new()
# print whatever.romanIntoNum("IV"), "\n"
# print whatever.romanIntoNum("VI"), "\n"
print whatever.idealRoman(6)