require_relative './scraper.rb'
require_relative './cli.rb'
require 'pry'
require 'colorize'


puts "\n\nHello from Bettye's Venues Tour List (tour.rb)"

module TourLikeBettye
    class Tour
        attr_accessor :venue, :location, :description, :talent
        @@all_venues = []

        def initialize(venue, location, description, talent=nil)
            @venue = venue.strip
            @location = location.strip
            @description = description
            @talent = talent.strip
            save

        end  

        def save
            @@all_venues << self

        end

        def self.all
            @@all_venues ||= self.load #otherwise
        end

        def self.load
            CLI.get_venues
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
