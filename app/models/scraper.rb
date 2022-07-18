require 'nokogiri'
require 'selenium-webdriver'
require 'open-uri'
# require 'net/http'
# require 'pry'

class Scraper

	def self.scrape_details
		url = "https://www.nytimes.com/"
		html = URI.open(url)
		# html = Net::HTTP.get(URI(url))
		doc = Nokogiri::HTML(html)
		titles = doc.css(".indicate-hover")
		# binding.pry
		# titles.each do |title|
		# 	puts title.text.strip
		# end
		return titles
	end

	def self.bot_scrape_details
		driver = Selenium::WebDriver.for :chrome
		driver.navigate.to "https://www.amazon.in/Apple-MacBook-14-inch-8%E2%80%91core-14%E2%80%91core/dp/B09JR8TX74/ref=sr_1_1?crid=2PVSOS69SXZRA&keywords=macbook+air+pro+16gb+ram+512+ssd&qid=1657630967&sprefix=macbook+air+pro+16+gb%2Caps%2C210&sr=8-1"
		wait = Selenium::WebDriver::Wait.new(:timeout => 20)
		name = wait.until {
			driver.find_element(:id, "productTitle")
		}
		puts name.text
		driver.quit
	end
end

Scraper.bot_scrape_details


