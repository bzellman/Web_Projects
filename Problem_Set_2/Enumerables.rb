module Enumerable

def my_each
	if block_given?
		for i in 0...self.size do
			yield(self[i])
		end
	end
	return self
end

def my_each_with_index
	if block_given?
		for i in 0...self.size do
			yield(self[i], i)
		end
	end
	return self
end

def my_select
	array = []
	if block_given?
		self.my_each do |i|
			if yield(i) == true
				array << i
			end
		end 
	end
	return array
end

def my_all?
	if block_given?
		self.my_each do |i|
			if yield(i) == false
				return false
			end
		end
		return true
	end
end

def my_any?
	if block_given?
		self.my_each do |i|
			if yield(i) == true
				return true
			end
		end
		return false
	end	
end

def my_none?
	if block_given?
		self.my_each do |i|
			if yield(i) == true
				return false
			end
		end
		return true
	end
end

def my_count
	i = 0
	self.my_each do
		i += 1
	end
	return i
end

# def my_map
# 	array = []
# 	if block_given?
# 		self.my_each do |i|
# 			array << yield(i)
# 		end
# 	end
# 	return array
# end

## my_map with a Proc
def my_map(&proc)
	array = []
	if block_given?
		self.my_each do |i|
			array << proc.call(i)
		end
	end
	return array
end


def my_inject
	result = nil
	if block_given?
		self.my_each do |i|
			if result == nil
				result = i
			else
				result = yield(result, i)
			end
		end
	end
	return result	
end

end



def multiply_els(array_to_multiply)
	return array_to_multiply.my_inject { |running_total, current_item| running_total * current_item}
end