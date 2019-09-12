require "TourLikeBettye/version"

module TourLikeBettye
  class Error < StandardError; end
  class
    attr_accessor :name, :age, :location, :user_name
 
    def initialize(user_name:, name:, age:, location:)
      @user_name = user_name
      @name = name
      @location = location
      @age = age
    end
  end 
  end
end
