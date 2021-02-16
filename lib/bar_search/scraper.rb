class BarSearch::Scraper

  def self.scrape_bar_basics
    doc = Nokogiri::HTML(open("https://www.theinfatuation.com/chicago/guides/best-bars-in-chicago"))

    bars = doc.css(".spot-block")
    bars.each do |bar|
      name = bar.css(".spot-block__title-copy h3").text.strip
      info = bar.css(".spot-block__description-section p").text.strip
      review_url = "https://www.theinfatuation.com" + bar.css(".spot-block__title-copy a").attribute("href").value

      price = ""
      bar.css(".overview-price-rating").each do |bar|
        price_num = bar.attribute("data-price").value
        if price_num == "1"
          price = "$"
        elsif price_num == "2"
          price = "$$"
        else
          price = "$$$"
        end
      end

      BarSearch::Bar.new(name, info, review_url, price)

    end


  end

  # def scrape_bar_profile(bar)
  #
  #   url = "#{bar.review_url}"
  #   doc = Nokogiri::HTML(open(url))
  #
  #   address = doc.css(".post__sidebar__info__col__block.contact-info .small").first.text
  #   website = doc.css(".post__sidebar__info__website a").attribute("href").value
  # end

end
