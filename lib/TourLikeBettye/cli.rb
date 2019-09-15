require_relative './scraper'

module TourLikeBettye
    
    class CLI
        
        def start #these are things that only run once

            puts "Welcome to the Tour Like Bettye app! (cli)\n
            This program is here to help music performers tour like a pro."
            BettyeScraper.bettye_venue_list
            @input = nil    # input as an instance variable - allows sharing user input from method to method
            menu
        end

        def menu
            puts <<-MENU
            Please choose from the choices below, 
            or enter the state (i.e. CA, PA, MN) in which you wish to tour!

            1. Blues Touring
            2. Jazz Touring
            3. Alt RB/Soul Touring
            4. Pop/Rock Touring
            5. Search by USA Region
            or type 'exit' or 'quit' at any time to leave the app.
            MENU
            # @input = gets.strip.downcase
            # input
        
            while @input != 'exit' && @input != 'quit' && @input != 'q'
                get_input(valid_choices: ["1", "2", "3", "4", 'menu', 'exit', 'quit', 'y'])
                
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
                    puts "Check out the Tour Like Belles app for Rock or Pop touring."
                    puts "For now, please try the menu items again."
                    # menu
                # elsif @input == "5"
                #     puts "Please enter the US state for you search."
                #     get_venue_by_state
                elsif @input == 'exit' || @input == 'quit' || @input == 'q'
                else
                    puts "\nSorry, please try again"
                    menu    # good way to set up recursion
                end 
            end
        end

        
        def get_input(valid_choices:)
            @input = gets.strip.downcase
            puts 'Goodbye and Goodluck!' if @input == 'exit' || @input == 'quit' || @input == 'q'
            puts Error unless valid_choices.include?(@input)
            # @input

        end

        def get_venues
            Tour.all.each.with_index(1) do |betvenues, index|
        #    binding.pry
                puts "Your selection shows these venues are recommended for your next tour...\n
                #{index}. #{betvenues.venue} - #{betvenues.location}"
            end
            prompt_for_venue_choice
        end

        # def get_venue_by_state
        #     venue_by_state = Tour.all.collect {|betvenues| betvenues == "or".upcase}
        #     # binding.pry
        #     puts "Your chosen state has the following venues recommended for you next tour:\n
        #                 #{venue_by_state}"
            
        # end

        def prompt_for_venue_choice
            puts "Start a search again enter 'y' or enter 'q' to quit."
            @input = gets.chomp.downcase.to_i
            index = @input - 1
            if index >= 0     # make sure that it's valid input
                get_venues #puts Tour.all   #[@input.to_i -1]   # This is the last item in the array/hash
            elsif @input == "y"
                menu    # recursion
            else
                puts "Sorry your entry ('#{@input}') is not valid.\nPlease try the menu items again."
                menu

            end

        end
    end
end