require 'rubygems'
# require 'rest-client'

# wiki_url = "http://en.wikipedia.org/"
# wiki_local_name = "wiki-page.html"

# File.open(wiki_local_name, "w") { |file| file.write(RestClient.get(wiki_url)) }

require 'open-uri'

url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
puts open(url).read

file = File.open("hamlet.txt", "w") { |f| f.write(open(url).read)}

File.open("hamlet.txt", "r") do |file|
	file.readlines.each_with_index do |line, index|
		if index % 42 == 0
			puts line
		end
	end
end