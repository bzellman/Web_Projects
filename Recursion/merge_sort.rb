def merge_sort(array)
	## Base Case Array has two or less to sort and return larger
	if array.count <= 2 
		if array.count == 2
			if array[0] < array[1]
				return array[1]
			else 
				return array[0]
			end
		else
			return array[0]
		end
	
	else
		##split array in 2 and send each to the merge_sort function

		first_array = array[0..array.count/2-1]
		second_array = array[array.count/2..-1]

		first_array.count <= 1 ? x = first_array[0] : x = merge_sort(first_array)
		second_array.count <= 1 ? y = second_array[0] : y = merge_sort(second_array)

		if x < y
			return y
		else 
			return x
		end
	end
end


array = Array.new(6) { rand(1..50) }
puts merge_sort(array)