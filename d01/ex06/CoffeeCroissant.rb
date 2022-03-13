#!/usr/bin/env ruby -w

def sort_hash()
	data = [
		['Frank', 33],
		['Stacy', 15],
		['Juan' , 24],
		['Dom' , 32],
		['Steve', 24],
		['Jill' , 24]
	]
	hsh = data.sort_by{|x| [x[1], x[0]]}
	hsh.each do |i| 
		puts i[0]
	end
end

sort_hash()