# require 'active_support'
require 'yaml'

$file_name = "hangman_data.yml"
$game_over = false
$number_of_guesses = 6

$guessed_letters = []
$missed_letters = []

def choose_word
	word_list = []
	raw_word_list = File.open("5desk.txt", "r") { |file| file.readlines }
	raw_word_list.each do |line|
		line = line[0...-2]
		length =  line.length
	  if length >= 5  && length <= 12
	  	word_list << line
	  end
	end

	word_list[rand(0..word_list.count)]	
end

def load_game
	if File.exist?($file_name)
		data = YAML::load_file $file_name
		$guessed_letters = data["guessed_letters"]
		$word = data["word"]
		$missed_letters = data["missed_letters"]
	end
end

def process_input
	input = gets.chomp
	if input == "--s"
		save_game
		$guessed_letters = []
		$missed_letters = []
		abort
	elsif input == "--l"
		load_game
	else
		$guessed_letters << input
	end
end


def check_word	
	word_to_print = ""
	$game_over = true
	$word.each_char do |l|
		isIn = false
		puts "Guessed Letters #{$guessed_letters}"
		$guessed_letters.each do |x| 
			puts x
			if x == l 
				isIn = true 
			end

			if !$word.include?(x) && !$missed_letters.include?(x)
				$missed_letters << x
			end
		end
	
		if isIn == true
			word_to_print << l + " " 
		else
			$game_over = false
			word_to_print << "_ "
		end
		
	end

	puts word_to_print
	puts "Nubmer of Guesses left #{$number_of_guesses - $missed_letters.count}"
	puts "Missed Letters: #{$missed_letters}"
end	

$word = choose_word

def save_game

	if !File.exist?($file_name)
		puts "File Does not exist"
		File.open("hangman_data.yml", "w")
		data = {}
	else
		data = YAML::load_file $file_name
	end
	data["guessed_letters"] = $guessed_letters
	data["word"] = $word
	data["missed_letters"] = $missed_letters
	puts data
	File.open("hangman_data.yml", "w") { |file| file.write data.to_yaml }
end


while $game_over == false && $missed_letters.count < 6
	puts "Guess A Letter"
	process_input
	check_word
end