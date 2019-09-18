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
                tour = formatter.strip.gsub("at", "").split("  ").uniq
                    venue = (tour[2] != nil) ? tour[2] : tour[1]  
                    location  = tour[0] 
                    description = tour[1]  
                    talent = (tour[3] != nil) ? tour[3] : 'no additional details'      
                    Tour.new(venue, location, description, talent) 
                end
            end
        end
    
end