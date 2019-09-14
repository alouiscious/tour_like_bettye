require "TourLikeBettye/version"
require "TourLikeBettye/cli"
require "TourLikeBettye/scraper"
require "TourLikeBettye/tour"
module TourLikeBettye
  
  class TourBettye
    attr_accessor :venue_name, :city, :description, :capacity
 
    def initialize(venue_name, city, description, capacity)
      @venue_name = venue_name 
      @city = city
      @description = description
      @capacity = capacity
    end
  end 


  class Error < StandardError; end
end
