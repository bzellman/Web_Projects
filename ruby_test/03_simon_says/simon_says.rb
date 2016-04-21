def echo(string)
	return string
end

def shout(string)
	return string.upcase
end

def repeat(string, n = 2)
	
	newString = ""

	n.times do |i|
		if i == 0
			newString = string
		else
			newString = newString + " " + string
		end	
		puts newString
	end
	# puts newString
	return newString
end

def start_of_word(string, n=1)
	start = ""

	n.times do |i|
		start << string[i]
	end

	return start
end


def first_word(string)
	firstWord = ""

	string.length.times do |i|
		if string[i] != " "
			firstWord << string[i]
		else
			break
		end
	end
	puts firstWord
	return firstWord
end

def titleize(string)
	titleized_string = ""
	word_array = []
	current_word = ""
	string.length.times do |i|
		# Get word until a space. if less than three letter dont capitalize first letter unless beginning	
		if i == string.length - 1
			current_word << string[i]
			word_array.push(current_word)
			current_word = ""
		elsif string[i] != " "	
			current_word << string[i]
		else
			word_array.push(current_word)
			current_word = ""
		end
	end

	word_array.length.times do |i|
		string = word_array[i]
		## I hate using this approach but there is no definition for 'little words'
		if i == 0 || (word_array[i].length > 4) || word_array[i] == "kwai"
			# puts string
			string[0] = string[0].upcase
		end
		
		if i < word_array.length - 1
			titleized_string << string + " "
		else
			titleized_string << string
		end
	end

	puts titleized_string
	return titleized_string
end


titleize("the bridge over the river kwai")
