#Question 4
def generate_fragments(length_of_fragment, number_of_fragments)
	#note that the nc_array would normally be a constant declared
	#outside scope of function and passed as argument
	nc_array = ["A","T","G","C"]
	fragment_batch = Array.new(number_of_fragments*1000000)
	
	fragment_batch.map! { |this_fragment|
		fragment_array = Array.new(length_of_fragment)
		fragment_array.map!{ nc_array.fetch(rand(3)) }
		fragment_array.join
	}
	return fragment_batch
end

length_of_fragment = ARGV[0].to_i
number_of_fragments = ARGV[1].to_i

results = generate_fragments(length_of_fragment, number_of_fragments)

puts results.inspect