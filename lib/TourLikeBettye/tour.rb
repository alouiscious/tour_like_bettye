require 'pry'
# require "bundler"
# require "bundler/setup"
# # require "../lib/venues_list.rb"
# require 'nokogiri'


puts "Hello from Bettye's Venues Tour List (tour.rb)"

# module Venues
    class Tour
        attr_accessor :venue, :location, :description, :capacity
       
        @@all_venues = [venue= "nil"]

        def initialize
            @@all_venues << self
            # binding.pry
 
        end
       
        def self.all
            @@all_venues ||= self.load #otherwise
        end

        def self.bettye_tours
            @@all_venues.select {|tour| tour_object.location == "" || tour_object.venue == ""}
        end

# ADD SELF.LOAD DEF
        def self.load
            @@all_venues
        end
        # def self.past_events
        #     @@bettyes_venues.select{|venue| venue.date < time.now}
        # end
        
        # def self.future_events
        #     @@bettyes_venues.select{|venue|venue.date >= time.now}
        # end
    end
# end
