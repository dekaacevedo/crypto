class CreateCryptoCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :crypto_coins do |t|
      t.string :name
      t.integer :rank
      t.string :symbol
      t.decimal :price
      t.decimal :volume_24h
      t.decimal :percent_change_1h
      t.decimal :percent_change_24h
      t.decimal :market_cap

      t.timestamps
    end
  end
end
