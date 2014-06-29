class FlightStatus

def initialize
	@code
end

require "json"
require "rest_client"

def get_input
	gets.strip
end

def enter_code
	puts "Enter your three-letter airport code:"
	@code = get_input
	status
end

def status
	begin
		response = JSON.parse(RestClient.get "http://services.faa.gov/airport/status/#{@code}.json")
		delay(response)
	rescue
		puts "That's not a valid 3-letter U.S. airport code. Try again."
		enter_code
	end		
end

def delay(response)
	if response['delay'] == "false"
		puts "#{response['name']} is not experiencing any delays right now."	
	elsif response['delay'] == "true"
		puts "#{response['name']} is delayed for #{response['status']['reason']}." 
			if response['status']['avgDelay'] == ""
				puts "You can expect a delay between #{response['status']['minDelay']} and #{response['status']['maxDelay']}."
			elsif
				puts "You can expect a delay of #{response['status']['avgDelay']}."
			end
	end
end

end