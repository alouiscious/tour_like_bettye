require "TourLikeBettye/version"
require "TourLikeBettye/cli"
require "TourLikeBettye/scraper"
require "TourLikeBettye/tour"

module TourLikeBettye
  
  class TourBettye
    attr_accessor :venue, :location, :description, :capacity
 
    def initialize      # (venue, location, description, capacity)
      @@all_venues << self
      # @venue = venue
      # @location = location
      # @description = description
      # @capacity = capacity
    end
  end 


  class Error < StandardError; end
end
