require 'open-uri'
require 'pry'
require "nokogiri"
class Scraper

  def self.scrape_index_page(index_url)
    student_hash = []
    doc = Nokogiri.HTML(open(index_url))
    doc.css(".roster-cards-container .student-card").each{|div|
      
      profile_url = div.css("a").attribute("href").value
      name = div.css(".card-text-container h4").text
      location = div.css(".card-text-container p").text
      student_hash << {:name => name, :location => location, :profile_url => profile_url }
    }
    student_hash
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri.HTML(open(profile_url))
    puts doc.css("social-icon-container a").size
  end

end

#puts Scraper.scrape_index_page("./fixtures/student-site/index.html")
Scraper.scrape_profile_page("./fixtures/student-site/students/ryan-johnson.html")

