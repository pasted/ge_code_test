

def total_bet_from_file(this_file)
	#Question 2
	#Outputs a sorted total bet by horse
	horse_hash = Hash.new
	horse_name = ""
	bet = 0
	current_bet = 0
	
	if this_file 
		File.open(this_file, "r") do |f|
			f.each_line do |line|
				tmp_array = line.split(";")
				horse_name = tmp_array[0]
				bet = tmp_array[1]
				if !horse_hash.include? horse_name
					horse_hash[horse_name] = bet.to_i
				else
					current_bet = horse_hash[horse_name]
					current_bet = current_bet.to_i + bet.to_i
					horse_hash[horse_name] = current_bet.to_i
				end
			end
		end
		sorted_horse_hash = Hash[horse_hash.sort_by{ |_, v| -v }]
		return sorted_horse_hash
	else
		raise ArgumentError.new("No filename available.")
	end
end

def display_totals(this_hash)
	#Displays total bet
	this_hash.each_pair do |key, value|
		puts "#{key} :: #{value}"
	end
end

def remove_duplicates_from_file(this_file)
	#Question 3
	#note if order of file is not important this can be accomplised by
	#sort this_file | uniq -u
	#following method will maintain original order
	if this_file
		line_array = Array.new
		File.open(this_file, "r") do |f|
			f.each_line do |line|
				if line_array.include? line
				else
					line_array.push(line)
				end
			end
		end
		
		File.open("dedup_#{this_file}", "w+") do |f|
			f.puts(line_array)
		end
	else
		raise ArgumentError.new("No filename available")
	end
	
end

if ARGV.length == 0
	puts "The script requires an argument which contains the name of the semi-colon seperated text"
	
else
	result_hash = total_bet_from_file("#{ARGV[0]}")
	puts "Output for Question 2"
	display_totals(result_hash)
	
	puts "Output for Question 3 in file dedup_#{ARGV[0]} "
	remove_duplicates_from_file("#{ARGV[0]}")
end