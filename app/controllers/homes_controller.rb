class HomesController < ApplicationController
  def index
    @titles = Scraper.scrape_details
  end
end
