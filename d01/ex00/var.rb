#!/usr/bin/env ruby -w

def print_str(name, val)
	if val == nil
		puts "\t#{name} contains: nil and is a type: #{val.class}"
	else	
		puts "\t#{name} contains: #{val} and is a type: #{val.class}"
	end
end

def my_var()
	a = 10
	b = "10"
	c = nil
	d = 10.0
	puts "my variables :"
	print_str("a", a)
	print_str("b", b)
	print_str("c", c)
	print_str("d", d)
end

my_var()