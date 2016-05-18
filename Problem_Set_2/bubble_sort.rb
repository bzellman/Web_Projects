# array_to_sort = [4, 11, 2, 9, 1, 100, 1000, 3, 12, 1321, 124, 514, 0, -1000, -9432]
array_to_sort = ["This", "Is", "A", "Array", "Of", "Strings"]


def bubble_sort(array_to_sort)
	control = []
	while control != array_to_sort
		control = array_to_sort.clone
		(array_to_sort.count - 1).times do |i|
			sorted_group = sort_function(array_to_sort[i], array_to_sort[i+1])
			array_to_sort[i] = sorted_group[0]
			array_to_sort[i+1] = sorted_group[1]
		end
	end
	puts array_to_sort
end

def bubble_sort_by(array_to_sort)
	control = []
	while control != array_to_sort
		control = array_to_sort.clone
		(array_to_sort.count - 1).times do |i|
			first = array_to_sort[i]
			second = array_to_sort[i+1]
			num = yield(first, second)
			if num > 0
				array_to_sort[i] = second
				array_to_sort[i+1] = first
			end
		end
	end
	puts "#{array_to_sort}"
end

def sort_function(x, y)
	if x > y
		low = y
		high = x
	else
		low = x
		high = y
	end
	return [low, high]
end

# bubble_sort(array_to_sort)
bubble_sort_by(array_to_sort) { |first, second| first.length - second.length }