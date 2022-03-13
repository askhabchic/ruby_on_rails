#!/usr/bin/env ruby -w

def check_state()
	if ARGV.length == 1
		compare_capitals(ARGV[0])
	end
end
  
def compare_capitals(state)
	states = {
		"Oregon" => "OR", "Alabama" => "AL",
		"New Jersey" => "NJ", "Colorado" => "CO"
	}
	capitals_cities = {		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
	}
	city = 00
	if capitals_cities.has_value?(state)
		capitals_cities.each do |key, value|
			if value == state
				city = key
			end
		end
		if states.has_value?(city)
			states.each do |key1,value1|
				if value1 == city
					puts "#{key1}"
				end
			end
		else
			puts "Unknown capital city"
		end
	else
		puts "Unknown capital city"
	end
end
  
  check_state()