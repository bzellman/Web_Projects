
require 'socket'
host = 'localhost'
port =  '3000'
path = '/index.htm'                 # The file we want 

request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read

headers, body = response.splict("\r\n\r\n", 2)

print body