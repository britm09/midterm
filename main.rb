# def show_message(message)
# 	puts message
# end

# def get_input
# 	gets.strip
# end

# show_message("Welcome to Delay Tracker!  Find out whether your airport is experiencing weather delays.")

require "json"
require "rest_client"

def get_ORD
	response = JSON.parse(RestClient.get "http://services.faa.gov/airport/status/ORD.json")
	response["state"].each do state
    state = state
    puts state
  end
end

get_ORD

# def get_mashable_stories
  # response = JSON.parse(RestClient.get "http://mashable.com/stories.json")
#   response["new"].each do |story|
#     title = story["title"]
#     puts title
#   end
# end

# get_mashable_stories