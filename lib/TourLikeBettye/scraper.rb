
require 'pry'
require 'open-uri'
require 'nokogiri'


module TourLikeBettye
    class BettyeScraper

        def self.bettye_venue_list
            jambase_noko = Nokogiri::HTML(open("https://www.jambase.com/band/bettye-lavette/past-shows"))
            
            jambase_noko.css('div.col-event-info').map do |bettye_tours|

                tour = bettye_tours.text.strip.gsub("at", "").split("  ")       #.text.strip.gsub("at", "").split("  ")

                    venue = tour[2]   # venue object attribute for tours 
                    location  = tour[0] # location object attribute for venue
                    description = tour[1]  # 
                    talent = (tour[3] != nil) ? tour[3] : 'no additional details'       # talent = tour[3]
                    Tour.new(venue, location, description, talent)      # creates a new tour object to assign attributes 

            end
            # "JAMBASE IS IN USE ABOVE"


        end


        # def self.bettye_venue_list
        #     jambase_noko = Nokogiri::HTML(open("https://www.jambase.com/band/bettye-lavette/past-shows"))
            
        #     jambase_noko.css('div.col-event-info').map do |bettye_tours|
                
        #         bettye_tours.each do |tour|
        #             bettye_tours.text.strip.gsub("at", "").split("  ")       #.text.strip.gsub("at", "").split("  ")
        #             tour_location_venue = tour
        #             # binding.pry
        #             location  = tour_location_venue[0]  # venue object attribute for tours 
        #             venue = tour_location_venue[2]      # location object attribute for venue
        #         end
        #         Tour.new(venue, location, description, capacity)      # creates a new tour object to assign attributes 

        #     end


        #     # "JAMBASE IS IN USE ABOVE"
        # end

    end
            # bettye_noko = Nokogiri::HTML(open('http://www.bettyelavette.com/tour'))
            # bettye_noko.css('.view-events').text.gsub("\n", "").strip.gsub("USAAn Intimate Evening with Bettye LaVette", "").split("    ").each do |details|
            #     @bettye_noko_arr = details
            # end
            #     attributes = {
            #         date: bettye_noko_arr[0],
            #         day: bettye_noko_arr[1],
            #         year: bettye_noko_arr[2],
            #         location: bettye_noko_arr[3]
            #     }
            
            
            # bandsintown_noko = Nokogiri::HTML(open('https://www.bandsintown.com/a/45926-bettye-lavette?came_from=267'))
            # bandsintown_noko.css("div").children
            

        
        
            # # attributes = {
            # #     :venue,
            # #     :city          
            # # }
            # # capacity: (rand 200..2500)
            # p @@bettyes_venues
end