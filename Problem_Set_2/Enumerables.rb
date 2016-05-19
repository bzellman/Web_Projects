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
	
# end

# def my_inject
	
# end

end
