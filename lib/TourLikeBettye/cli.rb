require_relative './scraper'
require 'colorize'


module TourLikeBettye
    
    class CLI

        
        def start
            puts "\nWelcome to the Tour Like Bettye app! (cli)\n\nThis program is here to help music performers tour like a pro."
            BettyeScraper.bettye_venue_list
            @input = nil   
            list_venues
        
        end

        def list_venues
            puts "\nThese venues are highly recommended for your next tour...\n"
            Tour.all.each.with_index(1) do |betvenues, index|
                choices = "#{index}. #{betvenues.venue}"
                puts choices.colorize(:red)
            end
            prompt_for_venue_choice
        end

        def prompt_for_venue_choice
            puts "\nEnter the number from the list above for additional venue details, or..."
            puts "    Start a new search enter 'y' or enter 'q' to quit."
            @input = gets.chomp
            valid_input(entry: (['menu', 'exit', 'quit', 'y', 'q']))
        end

        def valid_input(entry:)   
            if @input.to_i  <= Tour.all.length
                @index = @input.to_i - 1
                menu
            elsif entry.include?(@input.downcase)
                menu
            else
                puts "Sorry, your ('#{@input}') entry is not valid.\nPlease try a menu items number again, or enter 'q' to quit."
                valid_input
            end
        end

        def menu
            if @input.to_i <= Tour.all.length
                binding.pry
                puts "Here's the details about #{Tour.all[@index]}"
                p Tour.all[@index].join(",")
                prompt_for_venue_choice
            end
            
            if @input == "y"
                list_venues  
            elsif @input == 'exit' || @input == 'quit' || @input == 'q'
                puts 'Goodbye and break a leg!' 
                exit
            else
                prompt_for_venue_choice
            end
        end
    end
end