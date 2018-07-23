require 'open-uri'
require 'pry'
require "nokogiri"
class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri.HTML(open(index_url))
    doc.css("roster-cards-container").size
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

Scraper.scrape_index_page("../fixtures/fixtures/student-site/index.html")

