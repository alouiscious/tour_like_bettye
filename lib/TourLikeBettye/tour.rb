puts "Hello from VenuesList::Tour"
module VenuesList
    class Venue
        attr_accessor :name, :description

        def initialize(name, description)
            @name = name
            @description = description

        end
        @@all = []
        
        def self.all
            @@all ||= self.load
        end
    end
end
