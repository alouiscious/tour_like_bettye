require 'pry'
require "bundler"
require "bundler/setup"
# require "../lib/venues_list.rb"
require 'nokogiri'
require 'open-uri'


puts "Hello from VenuesList::Tour"
module Venues
    class Venue
        attr_accessor :name, :city, :city, :description, :capacity
       
        @@all_venues = []
        def initialize(name, description)
            @@all_venues << self
            # @name = name
            # @description = description
        end
       
        
        def self.all
            @@all_venues ||= self.load
        end

        def self.past_events
            @@bettyes_venues.select{|venue| venue.date < time.now}
        end
        
        def self.future_events
            @@bettyes_venues.select{|venue|venue.date >= time.now}
        end
    end
end
