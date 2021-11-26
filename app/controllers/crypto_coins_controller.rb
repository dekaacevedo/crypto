class CryptoCoinsController < ApplicationController

    def index
        @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=2d7e56c6-c59f-402d-867f-afbc819c4a4a'
        @uri = URI(@url)
        @response = Net::HTTP.get(@uri)
        @coins = JSON.parse(@response)
        @my_coins = ["BTC", "XRP", "ADA", "XLM"]
        save_coins        

        @crypto_coins = CryptoCoin.all
    end

    def save_coins
      @coins['data'].each do |x|
        @my_coins.each do |coin|
          if coin == x['symbol']
            CryptoCoin.create(name: x['name'], rank: x['cmc_rank'].to_i, symbol: x['symbol'], price: x['quote']['USD']['price'].to_f, percent_change_1h: x['quote']['USD']['percent_change_1h'].to_f, percent_change_24h: x['quote']['USD']['percent_change_24h'].to_f, market_cap: x['quote']['USD']['market_cap'].to_f, volume_24h: x['quote']['USD']['volume_24h'].to_f)
          end
        end
      end
    end
end
