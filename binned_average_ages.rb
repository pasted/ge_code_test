#Question 5
def binned_average_age(age_hash)
	binned_ages = Hash.new
	age_hash.values.each do |this_age|
		bin_key = case this_age.to_i
			when (10..19) then "10-20"
			when (20..30) then "20-30"
			when (30..1000) then "over 30"
		end
		
		if binned_ages.keys.include?(bin_key)
			age_array = binned_ages[bin_key]
			age_array.push(this_age)
			binned_ages[bin_key] = age_array
		else
			age_array = Array.new
			age_array.push(this_age)
			binned_ages[bin_key] = age_array
		end
	end
	return binned_ages
end

def calculate_average_ages(binned_ages)
	average_binned_ages = Hash.new
	
	binned_ages.each_pair do |key, age_array|
		number_of_ages = age_array.length
		total_age = age_array.reduce(0, :+)
		average_age = total_age / number_of_ages
		average_binned_ages[key] = average_age
	end
	return average_binned_ages
end
 
def calculate_average_binned_ages(age_hash)
	binned_ages = binned_average_age(age_hash)
	average_binned_ages = calculate_average_ages(binned_ages)
	return average_binned_ages
end

age_hash = {"tom" => 23, "harry" => 14, "dick" => 67, "jane" => 90, "jill" => 45, "joeline" => 20}
puts age_hash.inspect

average_binned_ages = calculate_average_binned_ages(age_hash)
puts average_binned_ages.inspect
