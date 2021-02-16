class BarSearch::CLI

    def call
        puts "\n\nWelcome to Chicago's Bar Search!".light_blue
        get_bars
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
      get_user_choice
    end

    def get_user_choice
      user_choice = gets.strip

      if user_choice == "exit"
        goodbye
      else
        if valid_input?(user_choice.to_i)
          show_bar_info(user_choice.to_i)
        else
          puts "\nI didn't get that. Please enter a number or type \"exit\".\n".yellow
          get_user_choice
        end
      end
    end

    def show_bar_info(user_choice)
      bar = @bars[user_choice - 1]

      puts "\nOkay, here's info for #{bar.name}:\n\n"
      puts "• About: #{bar.info}".light_blue
      puts "• Price Range: #{bar.price}".light_blue
      puts "• Website: #{bar.review_url}".light_blue

      again?
    end

    def valid_input?(user_chosen_bar)
      user_chosen_bar > 0 && user_chosen_bar < 26
    end

    def again?
      puts "\nDo you want to view the bar list again? [y/n]".red

      input = gets.strip

      if input == "y"
        list_bars
      elsif input == "n"
        goodbye
      else
        puts "I didn't get that. Please type \"y\" or \"n\"".yellow
        again?
      end
    end

    def goodbye
       puts "\nThanks for coming! Cheers!\n".light_blue
    end
end
