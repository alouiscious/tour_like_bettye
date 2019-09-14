# link to api or...
# scrape with nokogiri
# parse from json to ruby
require 'open-uri'
require 'nokogiri'
require 'pry'

class BettyeScraper

    def self.bettye_venue_list
        jambase_noko = Nokogiri::HTML(open("https://www.jambase.com/band/bettye-lavette/past-shows"))      # .text.split
        bettyetours = jambase_noko.css('div.col-event-info')
        bettyetours.each do |tour|
            tour_object = Tour.new
            tour_location_venu = tour.text.strip.gsub("at", "").split("  ")
            tour_object.location  = tour_location_venu[0]
            tour_object.venue = tour_location_venu[2]
            # binding.pry
        end
        # "JAMBASE IS IN USE ABOVE"
    end

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
