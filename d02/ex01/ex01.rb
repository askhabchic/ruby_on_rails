#!/usr/bin/env ruby -w

class Html
	attr_reader :page_name

	def initialize(value)  
		@page_name = value
		head
	end

	def head
		begin
			raise RuntimeError, "A file named #{page_name}.html already exist!" if File.exist?("#{page_name}.html")
			file = File.new("#{page_name}.html", "w")
			if file
				file.syswrite "<!DOCTYPE html>\n<html>\n<head>\n<title>#{page_name}</title>\n</head>\n<body>\n"
			end
			file.close()
		end
	end
	
	def dump(value)
		file = File.open("#{page_name}.html", "a")
		begin
			raise "There is no body tag in #{page_name}.html" if IO.foreach(file).none? {|str| str.include?("<body>")}
			raise "Body has already been closed in #{page_name}.html" if IO.foreach(file).any? {|str| str.include?("</body>")}
			file.syswrite "\t<p>#{value}</p>\n"
		end
		file.close()
	end

	def finish
		file = File.open("#{page_name}.html", "a")
		begin
			raise "#{page_name}.html has already been closed." if IO.foreach(file).any? {|str| str.include?("</body>")}
			file.syswrite "</body>\n</html>"
		end
		file.close
	end
end

if $PROGRAM_NAME == __FILE__
	a = Html.new("test")
	10.times{|x| a.dump("Hello from paragraph №#{x}")}
	a.finish
	a.finish
	10.times{|x| a.dump("Hello from paragraph №#{x}")}
end