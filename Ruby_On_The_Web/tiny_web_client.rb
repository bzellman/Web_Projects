require 'net/http'

host = 'http://localhost:3000'
path = '/index.htm'

http = Net::HTTP.new(host)
headers, body = http.get(path)
if headers.code == "200"
	puts "All good in the hood"
	puts "#{headers.code} #{headers.message}"
	print body
else
	puts "#{headers.code} #{headers.message}"
end