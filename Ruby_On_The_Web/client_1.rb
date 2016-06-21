require 'socket'
require 'json'

host = 'localhost'
port =  '3000'

puts "Do You Want To GET or POST"
option = gets.chomp

if option == "GET"
	path = '/index.html'                 # The file we want 

	request = "GET #{path} HTTP/1.0\r\n\r\n"

elsif option == "POST"
	path  = '/thanks.html'
	puts "What is Your name?"
	name = gets.chomp
	puts "What is Your email address?"
	email = gets.chomp
	hash_to_send = {:my_hash => {:name => name, :email=>email} }
	hash_to_send = hash_to_send.to_json

	# request =  "POST #{path} HTTP/1.0\r\n\r\n" +
	# 		"User-Agent: HTTPTool/1.0\r\n\r\n" +
	# 		"Content-Length: #{hash_to_send.size}\r\n\r\n" +
	# 		"#{hash_to_send}"

	request = "POST /thanks.html HTTP/1.0\r\nContent-Length: #{hash_to_send.size}\r\n\r\n#{hash_to_send}"

    puts "request: #{request}"

else 
	puts "I don't know how to do that"
end


socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read

headers, body = response.split("\r\n\r\n", 2)

print body

socket.close