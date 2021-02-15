class BarSearch::CLI

    NEIGH = ["West Loop", "Bronzeville", "Lakeview"]

    def call
        puts "\n\nWelcome to Chicago's Bar Search!".light_blue
        scrape
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
      # doc = Nokogiri::HTML(open("https://www.theinfatuation.com/chicago/guides/best-bars-in-chicago"))
      # bars = doc.css(".spot-block__title-copy h3").text.strip
      # info = doc.css(".spot-block__description-section p").text.strip
      #
      # ## prices for each bar
      # price = []
      # doc.css(".overview-price-rating").each do |bar|
      #   price << bar.attribute("data-price").value
      # end

      #temporary link for restaurant address and website
      link = Nokogiri::HTML(open("https://www.theinfatuation.com/chicago/reviews/guthries-tavern"))
      address = link.css(".post__sidebar__info__col__block.contact-info .small").first.text
      website = link.css(".post__sidebar__info__website a").attribute("href").value

    #  binding.pry

    end
end
