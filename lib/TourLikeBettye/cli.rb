module TourBettyeMenu
    
    class  CLI
        
        def start #these are things that only run once

            puts "Hey welcome to the Tour Like Bettye app!\n
            This program is here to help music performances tour like a pro."
            # Scraper.
            @input = nil
            menu
        end

        def menu
            while @input != "exit" && @input != "quit"
                get_input(
                    valid_choice: ["1", "2", "3", "4")
                if @input == "menu"
                    menu
                elsif @input == "1"
                    puts "Blues Touring"
                elsif @input == "2"
                    puts "Jazz Touring"
                elsif @input == "3"
                    puts "Alt RB/Soul Touring"
                elsif @input == "4"
                    puts "Pop/Rock Touring"
                elsif @input == "exit" || @input == "quit"
                else
                    puts "\nSorry, please try again"
                    menu # good way to set up recursion
                end 
            end
        end

        def menu 
            puts <<-MENU
            cities
            produces list of venues
            last performance date
            1. Blues Touring
            2. Jazz Touring
            3. Alt RB/Soul Touring
            4. Pop/Rock Touring
            or type 'exit' or 'quit' at any time to leave the app.
            MENU
        end
        
        def get_input(option)
            @input = gets.strip.downcase
            return if @input == "exit" || @input == "quit"
            puts error_message unless valid_choice.include?(@input)
            @input

        end
        def show_venues
            binding.pry
            BettyeVenues.all.each.with_index(1) do |betvenues|
                puts "#{index}. #{betvenues.name}"
            end
            prompt_for_venue_choice
        end

        def prompt_for_venue_choice
            @input = get.chomp.downcase
            # make sure that it's valid input
            @index = @input.to_i -1 # This is the last item in the array/hash

            puts BettyeVenues.all[@input.to_i - 1].summary
        end
    end
end