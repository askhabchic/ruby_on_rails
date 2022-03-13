#!/usr/bin/env ruby -w

class Html
	attr_reader :page_name

	def initialize(value)  
		@page_name = value
		head
	end

	def head
		file = File.new("#{page_name}.html", "w")
		if file
			file.syswrite "<!DOCTYPE html>\n<html>\n<head>\n<title>#{page_name}</title>\n</head>\n<body>\n"
		end
		file.close()
	end

	def dump(value)
		file = File.open("#{page_name}.html", "a")
		file.syswrite "\t<p>#{value}</p>\n"
		file.close
	end

	def finish
		file = File.open("#{page_name}.html", "a")
		file.syswrite "</body>\n</html>"
		file.close
	end
end

if $PROGRAM_NAME == __FILE__
	a = Html.new("test")
	10.times{|x| a.dump("Hello from paragraph №#{x}")}
	a.finish
end