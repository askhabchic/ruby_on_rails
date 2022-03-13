#!/usr/bin/env ruby -w


def print_info(cap, state, akr)
	if state != "none"
		puts "#{cap} is the capital of #{state} (akr: #{akr})"
	else
		puts "#{cap} is neither a capital city nor a state"
	end
end

def check_cap_or_state(name)
	if !name
		return
	end
	states = {
		"Oregon" => "OR", "Alabama" => "AL",
		"New Jersey" => "NJ", "Colorado" => "CO"
	}
	capitals_cities = {		
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
	}
	if capitals_cities.has_value?(name)
		index = capitals_cities.key(name)
		print_info(capitals_cities[index], states.key(index), capitals_cities.key(name))
	elsif states.has_key?(name)
		print_info(capitals_cities[states[name]], name, states[name])
	else
		print_info(name, "none", "")
	end
end

def main_function()
	if ARGV.length != 1 && ARGV[0].include?(",,")
		return
	else
		arr = ARGV[0].delete(' ').split(',')
		arr.each do |name|
			if !name.empty?
				check_cap_or_state(name.capitalize())
			end
		end
	end
end

main_function()