def ceaser_cipher(word, shift_key)
	alphabet_lower = "abcdefghijklmnopqrstuvwxyz"
	alphabet_upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	
	word_array = word.split(" ")
	new_string = String.new
	
	word_array.each do |w|
		w.length.times do  |i|	
			letter =  w[i]
			##Check if letter upper or lowercase
			if alphabet_lower.include? letter 
				if alphabet_lower.include? letter
					alphabet_array = alphabet_lower				
				else
					alphabet_array = alphabet_upper				
				end
				
				if (shift_key + alphabet_array.index(letter)) > alphabet_array.length - 1
					i = alphabet_array.index(letter) + shift_key - 26
				else
					i = alphabet_array.index(letter) + shift_key
				end
				
				new_string = new_string + alphabet_array[i]
			else
				new_string = new_string + letter
			 end
		
		end
		
		new_string = new_string + " "
	end
	puts new_string

end

test_word = "Bradley. Zellman!!!"
ceaser_cipher(test_word, 1)