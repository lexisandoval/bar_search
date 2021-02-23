class BarSearch::CLI

  def call
    puts "\n⭑ ⭑ ⭑ ⭑ Welcome to Chicago's Bar Search! ⭑ ⭑ ⭑ ⭑\n"
    get_bars
  end

  def get_bars
    @bars = BarSearch::Bar.all
    list_bars
  end

  def list_bars
    puts "\nWhich of the following bars would you like to learn more about?".light_blue
    puts "Enter the bar number or type \"exit\" to end your search.\n".light_blue

    @bars.sort_by {|bar| bar.name}.each.with_index(1) do |bar, index|
      puts "#{index}. #{bar.name}".red
    end

    puts " "
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
        puts "\nI didn't get that. Please enter a number between 1 and 25 or type \"exit\".\n".yellow
        get_user_choice
      end
    end
  end

  def show_bar_info(user_choice)
    bar = @bars[user_choice - 1]

    puts "\nOkay, here's info for #{bar.name}:\n\n"
    puts "• About: #{bar.info}".red
    puts "• Price Range: #{bar.price}".red
    puts "• Website: #{bar.review_url}".red

    again?
  end

  def valid_input?(user_chosen_bar) #add second arg
    user_chosen_bar > 0 && user_chosen_bar < 26
  end

  def again?
    puts "\nDo you want to view the bar list again? [y/n]\n".light_blue

    input = gets.strip

    if input == "y"
      list_bars
    elsif input == "n"
      goodbye
    else
      puts "\nI didn't get that. Please type \"y\" or \"n\".".yellow
      again?
    end
  end

  def goodbye
    puts "\nThanks for coming! Cheers!\n\n"
  end
  
end
