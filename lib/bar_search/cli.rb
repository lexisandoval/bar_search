class BarSearch::CLI

    # NEIGH = ["West Loop", "Bronzeville", "Lakeview"]

    def call
        puts "\n\nWelcome to Chicago's Bar Search!".light_blue
        get_bars
        list_bars
        # menu
        # goodbye
    end

    def get_bars
      @bars = BarSearch::Bar.all
    end

    def list_bars
      puts "\nWhich of the following bars would you like to learn more about?"
      puts "Enter the bar number or type exit to end your search.\n\n"
      @bars.each.with_index(1) do |bar, index|
        puts "#{index}. #{bar.name}"
      end

    end

    def menu
        input = nil

        while input != "exit"
            #
            # puts "\nWhich of the following bars would you like to learn more about?"
            # puts "Enter the bar number or type exit to end your search.\n\n"

            # @bars.each.with_index(1) do |bar, index|
            #     puts "#{index}. #{bar}\n".red
            # end

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
end
