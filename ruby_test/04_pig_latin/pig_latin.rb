$string_add = "ay"
$vowels = ['a','e','i','o','u']

def translate(string)
	string = string.downcase
	array_of_words = []
	string_to_send_to_array = ""

	string.length.times do |i|
		if (string[i] != " ") && (i != string.length-1)
			string_to_send_to_array << string[i]
		elsif i == string.length-1
			string_to_send_to_array << string[i]
			array_of_words.push(string_to_send_to_array)
			string_to_send_to_array = ""
		else
			array_of_words.push(string_to_send_to_array)
			string_to_send_to_array = ""
		end
	end

	array_of_words.length.times do |i|
		word = array_of_words[i]
		if $vowels.include? word[0]
			array_of_words[i] = vowel(word)
		else
			array_of_words[i] = consonant(word)
		end
	end

	return array_of_words.join(" ")
end

def vowel(string)
	string = string << $string_add
	
	return string
end

def consonant(string)	
	string.length.times do |i|
		if string[0] == "q" && string[1] == "u"
			string = string[2..-1] << string[0..1]
		elsif !$vowels.include? string[0]
			string = string[1..-1] << string[0]
		else
			break
		end
	end

	string << $string_add
	return string
end