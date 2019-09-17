require_relative './scraper'
require 'colorize'


module TourLikeBettye
    
    class CLI
        
        def start #these are things that only run once

            puts "Welcome to the Tour Like Bettye app! (cli)\n\nThis program is here to help music performers tour like a pro."
            BettyeScraper.bettye_venue_list
            get_venues
            @input = nil    # input as an instance variable - allows sharing user input from method to method
            menu
        end

        def menu
 
            until @input == 'exit' || @input || 'quit' || @input == 'q'
                get_input(valid_choices: [(1..Tour.all.length), 'menu', 'exit', 'quit', 'y', 'q'])
                
                if @input == "menu"
                    menu
                elsif @input == "1"
                    puts "Blues Touring"
                    get_venues
                elsif @input == "2"
                    puts "Jazz Touring"
                    get_venues
                elsif @input == "3"
                    puts "Alt RB/Soul Touring"
                    get_venues
                elsif @input == "4"
                    puts "Pop/Rock Touring"
                    puts "\nCheck out the Tour Like Belles app for Rock or Pop touring."
                    puts "For now, please try the menu items again.\n\n"
                    menu
                # elsif @input == "5"
                #     puts "Please enter the US state for you search."
                #     get_venue_by_state
                elsif @input == 'exit' || @input == 'quit' || @input == 'q'
                else
                    puts "\nSorry your entry ('#{@input}') is not valid.\nPlease try the menu items again.\n"
                    menu    # good way to set up recursion
                end 
            end
        end

        
        def get_input(valid_choices:)
            @input = gets.strip.downcase
            puts 'Goodbye and break a leg!' if @input == 'exit' || @input == 'quit' || @input == 'q'
            puts Error unless valid_choices.include?(@input)
            # @input

        end

        def get_venues
            puts "\nThese venues are highly recommended for your next tour...\n"

            Tour.all.each.with_index(1) do |betvenues, index|
binding.pry
                choices = "#{index}. #{betvenues.venue}"
                puts choices.inspect.colorize(:red)
            end

            prompt_for_venue_choice
        end

        # def get_venue_by_state
        #     venue_by_state = Tour.all.collect {|betvenues| betvenues.state == @input.upcase}
        #     # binding.pry
        #     puts "Your chosen state has the following venues recommended for you next tour:\n
        #                 #{venue_by_state}"
            
        # end

        def prompt_for_venue_choice
            puts "\nFor more venue details, enter the number from the list above"
            puts "\nStart a new search enter 'y' or enter 'q' to quit."
            @input = gets.chomp.downcase.to_i
            index = @input.to_i - 1
          binding.pry
        if index.eql?(1..TourLikeBettye::BettyeScraper.all.length)  # && @input != "y"  || @input != "q"  # make sure that it's valid input
               puts Tour[index]    #[@input.to_i -1]   # This is the last item in the array/hash
               #get_venues 
            # elsif @input == "q"
                # get_input("quit")   # create a redirect to quit or exit
            elsif @input == "y"
                menu    # recursion
            else
                puts "Sorry your entry ('#{@input}') is not valid.\nPlease try the menu items again."
                

            end

        end
    end
end