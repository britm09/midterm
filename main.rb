$:.unshift (File.dirname(__FILE__))
require 'library/flight_status'

puts "Welcome to Delay Tracker!  Find out whether your airport is experiencing any delays."

x = FlightStatus.new
x.enter_code