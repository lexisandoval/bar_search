class BarSearch::CLI

    def call
        puts "\n\nWelcome to Chicago's Bar Search!".light_blue

        get_bars
        goodbye
        #list_bars
        # menu
        # goodbye
    end

    def get_bars
      @bars = BarSearch::Bar.all
      list_bars
    end

    def list_bars
      puts "\nWhich of the following bars would you like to learn more about?"
      puts "Enter the bar number or type exit to end your search.\n\n"

      @bars.each.with_index(1) do |bar, index|
        puts "#{index}. #{bar.name}".red
      end
      get_bar_choice
    end

    def get_bar_choice
      user_chosen_bar = gets.strip.to_i
      if valid_input?(user_chosen_bar)
        show_bar_info(user_chosen_bar)
      else
        puts "\nI didn't get that. Please enter a number or type \"exit\".".light_magenta
        get_bar_choice
      end
    end

    def show_bar_info(user_chosen_bar)
      bar = @bars[user_chosen_bar - 1]
      puts "\nOkay, here's info for #{bar.name}:\n\n"
      puts "#{bar.info}\n".light_blue
      puts "Website: #{bar.review_url}".light_blue
    end

    def valid_input?(user_chosen_bar)
      user_chosen_bar > 0 && user_chosen_bar < 26
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
