class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  
  def home
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=2d7e56c6-c59f-402d-867f-afbc819c4a4a'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ["BTC", "XRP", "ADA", "XLM"]

    
  end

end
