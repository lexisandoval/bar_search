class BarSearch::CLI 
    
    NEIGH = ["West Loop", "Bronzeville", "Lakeview"]

    def call
        puts "\n\nWelcome to Chicago's Bar Search!".light_blue
        menu
        goodbye
    end

    def menu
        input = nil
        
        while input != "exit"

            puts "\nWhich of the following neighborhoods would you like to browse?"
            puts "Enter the neighborhood number or type exit to end your search.\n\n"


            NEIGH.each.with_index(1) do |neighborhood, index|
                puts "#{index}. #{neighborhood}\n".red
            end

            input = gets.strip.downcase
            case input
            when "1"
                puts "\ninfo for WL".blue
            when "2"
                puts "\ninfo for BV".blue
            when "3" 
                puts "\ninfo for LV".blue
            else
                puts "\nI didn't get that. Please enter a number or type \"exit\".".light_magenta
            end
        end

    end

    def goodbye
       puts "\nThanks for coming! Cheers!\n".light_blue
    end


    def scrape


    end
end