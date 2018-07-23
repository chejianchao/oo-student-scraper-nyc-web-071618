require 'open-uri'
require 'pry'
require "nokogiri"
class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri.HTML(open(index_url))
    doc.css(".roster-cards-container div").each{|div|
      profile_url = div.css("a").attribute("href").value
      name = div.css(".card-text-container h4").text
      location = div.css(".card-text-container")
    }
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

puts Scraper.scrape_index_page("./fixtures/student-site/index.html")

