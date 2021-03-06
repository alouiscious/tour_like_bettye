require 'colorize'
require 'pry'
require 'open-uri'
require 'nokogiri'


module TourLikeBettye
    class BettyeScraper

        def self.bettye_venue_list
            jambase_noko = Nokogiri::HTML(open("https://www.jambase.com/band/bettye-lavette/past-shows"))
            
            jambase_noko.css('div.col-event-info').map do |bettye_tours|
                formatter = bettye_tours.text.strip.gsub("Bettye LaVette ", " ")
                tour = formatter.strip.gsub("at", "").split("  ")
                venue = (tour[2] != nil) ? tour[2].strip : tour[1].strip  
                location  = tour[0].strip 
                description = tour[1].strip  
                talent = (tour[3] != nil) ? tour[3].strip : 'no additional details'   

                Tour.new(venue, location, description, talent)



            end
    
        
        end
    end
    
end