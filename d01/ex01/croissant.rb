#!/usr/bin/env ruby -w

def open_file()
	arr = []
	if File.exist?("numbers.txt")
		IO.foreach("numbers.txt"){|block| arr << block.delete(",").to_i()}
	else
		puts "No such file"
	end
	puts arr.sort()
end

open_file()