#!/usr/bin/env ruby -w

# class Dup_file < StandardError
# 	attr_reader :name

# 	def initialize(name)
# 		@name = name
# 		@new_name
# 	end

# 	def show_state
# 		path = File.expand_path(@name, __FILE__)
# 		puts "A file named #{@name} was already there: #{path}"
# 	end

# 	def correct
# 		@new_name = String.new(@name)
# 		@new_name.insert(@new_name.index(".html"), ".new")
# 		File.new(@new_name, "w")
# 		# puts @new_name
# 	end

# 	def explain
# 		path = File.expand_path(@new_name, __FILE__)
# 		puts "Appended .new in order to create requested file: #{path}"
# 	end

# end

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
				arr << str if str.none?("</body>")
				@line_number = index + 1
			end
		end
		file.close
		File.open(@filename, "w") do |file|
			arr.each { |str| file << str }
	end

	def explain
		puts "\t> li :#{@line_number} </body> : text has been inserted and tag moved at the end of it."
	end

end


str = String.new("sdfghjgretytrfd")
a = Body_closed.new("a.html", str)
a.show_state
a.correct
# a.explain