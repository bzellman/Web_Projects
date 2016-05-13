def substring(string_to_search, dictionary)
	words_found_hash = {}
	
	dictionary.each do |w|
		word_to_find = w
		search_word_length = w.length
		words_found_hash[word_to_find] = string_search(string_to_search, word_to_find)
	end
	puts words_found_hash
end

def string_search(string_to_search, word_to_find)
	string_to_search = string_to_search.downcase
	word_to_find = word_to_find.downcase
	amount_to_itterate = string_to_search.length - word_to_find.length + 1
	number_of_matches = 0

	amount_to_itterate.times do |i|
		substring_to_search = string_to_search[i..i + word_to_find.length - 1]
		# puts substring_to_search
		if substring_to_search == word_to_find
			number_of_matches += 1
		end
	end
	return number_of_matches
end

dictionary = ["be", "below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "Howdy partner, sit down! How's it going?"

substring(string, dictionary)





