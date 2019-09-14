require 'pry'
# require "bundler"
# require "bundler/setup"
# # require "../lib/venues_list.rb"
# require 'nokogiri'


puts "Hello from VenuesList::Tour"

# module Venues
    class Tour
        attr_accessor :venue, :location, :description, :capacity
       
        @@all_venues = []

        def initialize(venue, location)
            @@all_venues << self
            # @venue_name = venue_name
            # @description = description
        end
       
        
        def self.all
            @@all_venues ||= self.load #otherwise
        end

        def self.bettye_tours
            @@all.select {|tour| tour_object.location == "" || tour_object.venue == ""}
        end


        # def self.past_events
        #     @@bettyes_venues.select{|venue| venue.date < time.now}
        # end
        
        # def self.future_events
        #     @@bettyes_venues.select{|venue|venue.date >= time.now}
        # end
    end
# end
