def index_of_greatest_num_in_array(arr)
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
  best_sell_day = index_of_greatest_num_in_array(profits)
  best_sell_day = buy_day if profits[best_sell_day] == 0
  {buy_day:buy_day, sell_day:best_sell_day, profit:profits[best_sell_day]}
end

def stock_picker(stock_prices)
  best_days = []
  stock_prices.each_index do |buy_day|
    best_days << best_sell_day_for_buy_day(stock_prices, buy_day)
  end
  best = best_days.max_by {|day_info| day_info[:profit]}
  [best[:buy_day], best[:sell_day]]
end

print stock_picker([17,3,6,9,15,8,6,1,10])
puts