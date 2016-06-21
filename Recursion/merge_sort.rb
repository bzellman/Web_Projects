## if there are less that two items in the array return


## else split the array in two arrays

array = Array.new(6) { rand(1..50) }
 
def merge_sort(array)
	puts "The input array #{array}"
	if array.count <= 2 
		
		if array.count == 2
			if array[0] < array[1]
				puts "The Larger #{array[1]}"
				return array[1]
			else 
				puts "The Larger #{array[0]}"
				return[0]
			end

		else
			puts "The Larger #{array[0]}"
			return array[0]
		end
	
	else
		##split array in 2 and send each to the merge_sort function
		first_array = array[0..array.count/2-1]
		second_array = array[array.count/2..-1]
		# puts "1 #{first_array}"
		# puts "2 #{second_array}"
		first_array.count == 1 ? x = first_array[0] : x = merge_sort(first_array)
		second_array.count == 1 ? y = second_array[0] : y = merge_sort(second_array)
		# puts "X #{x}" 
		# puts "Y #{y}"

		# should only be  Fix Nums not array as this should drill down but it doesn't 
		if x < y
			# puts "The Larger Number is #{y}"
			return y
		else 
			# puts "The Larger Number #{x}"
			return x
		end

	end
end

puts merge_sort(array)