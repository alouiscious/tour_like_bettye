require_relative './scraper'
require 'colorize'


module TourLikeBettye
    
    class CLI
        
        def start #these are things that only run once

            puts "Welcome to the Tour Like Bettye app! (cli)\n\nThis program is here to help music performers tour like a pro."
            BettyeScraper.bettye_venue_list
            @input = nil   
            list_venues
        
        end

        def list_venues
            puts "\nThese venues are highly recommended for your next tour...\n"
            Tour.all.each.with_index(1) do |betvenues, index|
                choices = "#{index}. #{betvenues.venue}"
                puts choices.inspect.colorize(:red)
            end
            prompt_for_venue_choice
        end

        def prompt_for_venue_choice
            puts "\nEnter the number from the list above for additional venue details, or..."
            puts "    Start a new search enter 'y' or enter 'q' to quit."
            @input = gets.chomp.downcase.to_i

            valid_input(valid_choices: [(0..Tour.all.length), 'menu', 'exit', 'quit', 'y', 'q'])
        #   binding.pry
            menu

        end

        def menu

            @index = @input.to_i - 1

            if @index.eql?(1..Tour.all.length) 
                puts Tour.all[@index] 
            elsif @input == "y"
                list_venues    
            else
                puts "Sorry, your ('#{@input}') entry is not valid.\nPlease try a menu items number again."
                prompt_for_venue_choice

            end

        end

        
        def valid_input(valid_choices:)
            puts Error unless valid_choices.include?(@input)
            puts 'Goodbye and break a leg!' if @input == 'exit' || @input == 'quit' || @input == 'q'
            
            # binding.pry
        end
    end
end