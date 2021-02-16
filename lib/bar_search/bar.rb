class BarSearch::Bar

  attr_accessor :name, :info, :review_url, :price
  @@all = []

  def initialize(name, info, review_url, price)
    @name = name
    @info = info
    @review_url = review_url
    @price = price
    save
  end

  def self.all
    BarSearch::Scraper.scrape_bar_basics if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end

end
