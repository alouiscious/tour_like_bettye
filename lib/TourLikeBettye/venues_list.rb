

require 'pry'
# require "bundler"
# require "bundler/setup"
# require "../lib/venues_list.rb"
require 'nokogiri'
require 'open-uri'

# class BettyeVenues
    bettyes_venues = []
    jambase_noko = Nokogiri::HTML(open("https://www.jambase.com/band/bettye-lavette"))
# binding.pry
     bettyes_venues << jambase_noko.css('.jbshow jbevent')
     attributes = {
         :venue
         :city
         :capacity (rand 200..2500)
         
     }
     p bettyes_venues

# end