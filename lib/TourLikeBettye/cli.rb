require_relative './scraper'
require 'colorize'


module TourLikeBettye
    
    class CLI

        
        def start
            puts "\nWelcome to the Tour Like Bettye app!".colorize(:red)
            puts "This program is here to help music performers tour like a pro."
            BettyeScraper.bettye_venue_list
            @input = nil   
            venue_menu
        
        end

        def venue_menu
            puts "\nThese venues are highly recommended for your next tour...\n"
            Tour.all.each.with_index(1).uniq do |betvenues, index|
                @choices = "#{index}. #{betvenues.venue}"
                puts @choices.colorize(:red)
            end
            prompt_for_venue_choice
        end

        def prompt_for_venue_choice
            puts "\nEnter the number from the list above for additional venue details, or...".colorize(:blue)
            puts "    Start a new search enter 'y' or enter 'q' to quit."
            @input = gets.strip.downcase
            validate_input(entry: (['menu', 'exit', 'quit', 'y', 'q']))
        end

        def validate_input(entry:)   
            if @input == "y"
                venue_menu  
            elsif @input == 'exit' || @input == 'quit' || @input == 'q'
                puts "Goodbye and break a leg!\n"
                exit
            elsif @input.to_i  <= Tour.all.length && @input.to_i >= 0
                @index = @input.to_i - 1
                list_venue
            else
                puts "Sorry, your entry ('#{@input}') is not valid.\nPlease try a menu items number again, or enter 'q' to quit."
                validate_input
            end
        end

        def list_venue
            if @input.to_i <= Tour.all.length
                puts "\nVenue ##{@input}: The #{Tour.all[@index].venue} venue: ".colorize(:blue)
                puts "It's located in #{Tour.all[@index].location}. \n"
                puts "\nIf available below, additional details may include...".colorize(:blue)
                puts "   other talent's sucessful perfomances, or \n   the best time of year for you to book that venue."
                puts "\nDetails:"
                puts Tour.all[@index].description
                puts Tour.all[@index].talent.colorize(:red)

                prompt_for_venue_choice

            end
        end
    end
end