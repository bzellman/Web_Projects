def add(n1, n2)
	return n1 + n2
end

def subtract(n1, n2)
	return n1 - n2
end

def sum(array)
	theTotal = 0
	if array.length > 0
		array.each do |i|
			theTotal += i
		end	
	end
	return theTotal
end

def multiply(array)
	theTotal = 1
	if array.length > 0
		array.each do |i|
			theTotal = theTotal * i
		end	
	end

	return theTotal
end

def power(n1, n2)
	theTotal = 1;
	n2.times do
		theTotal = theTotal * n1
	end

	return theTotal
end

def factorial(n)
	if n  > 0
		theTotal = 1
		while n > 0 do
			theTotal = theTotal * n
			n = n - 1
		end
	else 
		theTotal = 1
	end

	return theTotal
end


factorial(5)

# power(5, 10)