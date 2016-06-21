require 'jumpstart_auth'

class MicroBlogger
	attr_reader :client

	def initialize
		puts "Initing"
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		if message.length > 140
			puts "The message can not be posted due to length"
		else
			@client.update(message)
		end
	end

	def dm(target, message)
		## Returned too many requests can not test
		# screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
		# puts screen_names
		# if screen_names.include?(target)
			message = "d @#{target} #{message}"
			tweet(message)
		# else
			# puts "I'm sorry, You are not following that person and can not DM them"
		# end
	end

	def everyones_last_tweet
		friends = @client.friends
		# tweets= []
		# puts friends
		# friends.each do |friend|
		# 	last_message = friend.status.text #find message
		# 	puts friend.status.name #screen_name
		# 	puts last_message
		# end
	end

	def run
		puts "Welcome to Brad's Terminal Twitter Client!"
		command = ""
		while command != "q"
			printf "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			case command
		    	when 'q' then puts "Goodbye!"
		    	when 't' then tweet(parts[1..-1].join(" "))
		    	when 'dm' then dm(parts[1], parts[2..-1].join(" "))
		    	when "elt" then everyones_last_tweet
				else 
					puts "Sorry, I don't know how to #{command}"
			end
		end
	end
end

blogger = MicroBlogger.new
testSting = "".ljust(140,"abab")
puts testSting
blogger.run