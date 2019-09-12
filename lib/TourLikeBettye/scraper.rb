# link to api
# scrape with nokogiri
# parse from json to ruby
require 'open-uri'
require 'nokogiri'

class BettyeScraper
    @@bettyes_venues = []


    def ?????
        jambase_noko = Nokogiri::HTML(open("https://www.jambase.com/band/bettye-lavette"))
        # binding.pry
        @@bettyes_venues << jambase_noko.css('.jbshow jbevent')
        attributes = {
            :venue
            :city
            :capacity (rand 200..2500)
            
        }
        p bettyes_venues
    end

# end