#!/usr/bin/env ruby -w

class Html
	attr_reader :page_name

	def initialize(value)  
		@page_name = value
		head
	end

	def head
		begin
			raise Dup_file.new("#{page_name}") if File.exist?("#{page_name}.html")
			file = File.new("#{page_name}.html", "w")
			if file
				file.syswrite "<!DOCTYPE html>\n<html>\n<head>\n<title>#{page_name}</title>\n</head>\n<body>\n"
			end
			file.close()
		rescue Dup_file => e
			e.show_state
			e.correct
			e.explain
		end
	end
	
	def dump(value)
		file = File.open("#{page_name}.html", "a")
		begin
			raise "There is no body tag in #{page_name}.html" if IO.foreach(file).none? {|str| str.include?("<body>")}
			begin
				raise Body_closed.new("#{page_name}.html", value) if IO.foreach(file).any? {|str, index| str.include?("</body>")}
			rescue Body_closed => e
				e.show_state
				e.correct
				e.explain			
			end
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


class Dup_file < StandardError
	attr_reader :name, :new_name

	def initialize(name)
		@name = name
		@new_name = nil
		@path = nil
	end

	def show_state
		@path = File.expand_path(@name + ".html", __FILE__)
		puts "A file named #{@name}.html was already there: #{@path}"
	end

	def correct
		@new_name = String.new(@name) + ".new"
		# while 
		begin
			raise exc = Dup_file.new(@new_name) if File.file?("#{@new_name}.html")
		rescue => exc
			@new_name = exc.correct
		end

		File.new("#{@new_name}.html", "w+")
		@new_name
	end

	def explain
		path = File.expand_path(@new_name, __FILE__)
		puts "Appended .new in order to create requested file: #{path}"
	end

end

class Body_closed < StandardError
	attr_reader :filename, :new_text

	def initialize(filename, new_text)
		@filename = filename
		@new_text = new_text
		@line_number = 0
	end

	def show_state
		puts "In #{@filename} body was closed :\n"
	end

	def correct
		arr = []
		File.open(@filename, "r") do |file|
			file.each_with_index do |str, index|
				arr << str unless str.include?("</body>")
				@line_number = index + 1
			end
		end
		File.open(@filename, "a") do |file|
			arr.each { |str| file << str }
		end
	end

	def explain
		puts "\t> li :#{@line_number} </body> : text has been inserted and tag moved at the end of it."
	end

end

if $PROGRAM_NAME == __FILE__
	a = Html.new("test")
	10.times{|x| a.dump("Hello from paragraph №#{x}")}
	a.finish
	# a.finish
	# 10.times{|x| a.dump("Hello from paragraph №#{x}")}
end