require "csv"
require "sunlight/congress"
require "erb"

template_letter = File.read("template_letter.html")
erb_template = ERB.new template_letter

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

puts "EventsManager initialized"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5,"0")[0..4]
end

def legislator_by_zip(zipcode)
	Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_letter_letter(id, form_letter)
	Dir.mkdir("output") unless Dir.exists? "output"

	filename = "output/thanks_#{id}.html"

	File.open(filename, "w") { |file| file.puts form_letter }
end


contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
	id = row[0]
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])	

	legislators = legislator_by_zip(zipcode)
	form_letter = erb_template.result(binding)

	save_letter_letter(id, form_letter)

end