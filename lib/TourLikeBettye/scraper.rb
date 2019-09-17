
require 'pry'
require 'open-uri'
require 'nokogiri'


module TourLikeBettye
    class BettyeScraper

        def self.bettye_venue_list
            jambase_noko = Nokogiri::HTML(open("https://www.jambase.com/band/bettye-lavette/past-shows"))
            
            jambase_noko.css('div.col-event-info').map do |bettye_tours|
                tour = bettye_tours.text.strip.gsub("at", "").split("  ") 
                    venue = tour[2].strip   
                    location  = tour[0] 
                    description = tour[1]  
                    talent = (tour[3] != nil) ? tour[3] : 'no additional details'      
                    Tour.new(venue, location, description, talent)     
            end
            # "JAMBASE IS IN USE ABOVE"
         end
     end
end