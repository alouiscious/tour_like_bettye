require 'pry'
require_relative './scraper.rb'
require_relative './cli.rb'

# require 'nokogiri'


puts "Hello from Bettye's Venues Tour List (tour.rb)"

module TourLikeBettye
    class Tour
        attr_accessor :venue, :location, :description, :capacity

        def initialize(venue = "Lincoln Center of the Arts", location = "Washington, DC")
            @venue = venue
            @location = location
        end  

        @@all_venues = [
            Tour.new(venue= "Lincoln Center of the Arts", location= "Washington, DC")
        ]        
     
        # binding.pry
        def self.all
            @@all_venues ||= self.load #otherwise
        end

        def self.load
            CLI.get_venues
        end
        
        def save
            @@all_venues << self

        end

        def self.bettye_tours
            @@all_venues.select {|tour| tour_object.location == "" || tour_object.venue == ""}
        end

        # def self.past_events
        #     @@bettyes_venues.select{|venue| venue.date < time.now}
        # end
        
        # def self.future_events
        #     @@bettyes_venues.select{|venue|venue.date >= time.now}
        # end
    end
end
