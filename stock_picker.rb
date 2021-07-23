def index_of_greatest_in_array(arr)
  arr.find_index(arr.max)
end

def profits_of_each_sell_day_for_buy_day(prices, buy_day)
  profits = []
  (buy_day).times {profits << 0}

  for day in buy_day...prices.length
    profits << (prices[day] - prices[buy_day])
  end
  profits
end

def best_sell_day_for_buy_day(prices, buy_day)
  profits = profits_of_each_sell_day_for_buy_day(prices,buy_day)
  #print profits
  #puts
  best_sell_day = index_of_greatest_in_array(profits)
  best_sell_day = buy_day if profits[best_sell_day] == 0
  best_sell_day
end

def stock_picker(stock_prices)
  best_sell_days = []
  stock_prices.each_with_index do |index|
    best_sell_days << best_sell_day_for_buy_day(stock_prices, index)
  end
end

