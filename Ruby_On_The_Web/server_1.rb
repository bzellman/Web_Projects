require 'socket'   
require 'json'      

server = TCPServer.new('localhost', 3000)  # Socket to listen on port 2000

loop {
	Thread.start(server.accept) do |c|

    request = c.read_nonblock(256)
  	header, body = request.split("\r\n\r\n", 2)
  	method = request.split[0]
  	path = header.split[1][1..-1]

  	if method == "GET"
  		file = File.open("#{path}", "r")

  		c.print "GET /index.html HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/html\r\n\r\n"+
           "#{file.read}"

 	elsif method == "POST"
 		params = JSON.parse(body)
 		va = params
 		puts "PARAMS #{params['my_hash']['name']}"
 		data = "<li>Namee: #{params['my_hash']['name']}</li>"
 		puts "data #{data}"
 		file = File.open("#{path}", "r")
 		
        c.print "POST /thanks.html HTTP/1.0 200 OK\n#{Time.now.ctime}\n" \
        "Content-Length: #{path.size}\r\n\r\n" \
        "#{file.read.gsub("<%= yield %>", data)}"

 	else
  		puts "MEH"
  		  	c.print "HTTP/1.1 404 Not Found\r\n" +
           "Content-Type: text/html\r\n"

  		c.print "\r\n"
  		file_not_found = "ERROR 404: The requested page could not be found. Please try another request"
  		c.print file_not_found
  end

  c.close

  end
}
