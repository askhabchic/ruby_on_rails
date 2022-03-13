#!/usr/bin/env ruby -w

def check_state()
  if ARGV.length != 1
	return
  else
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
	if states.has_key?(state)
		states.each do |key, value|
			if key == state
				city = value
			end
		end
		if capitals_cities.has_key?(city)
			capitals_cities.each do |key1,value1|
				if key1 == city
					puts "#{value1}"
				end
			end
		else
			puts "Unknown state"
		end
	else
		puts "Unknown state"
	end
end

check_state()