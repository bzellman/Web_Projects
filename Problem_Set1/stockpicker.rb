def stock_picker(stock_array)
	best_deal = [0,0,0,0,0]

	stock_array.count.times do |i|
		buy_price = stock_array[i]
		buy_date = i
		stock_array.count.times do |j|

			if i < j
				sell_price = stock_array[j]	
				sell_date = j
				difference = sell_price - buy_price
				analysis_array = [buy_price, buy_date, sell_price, sell_date, difference]
# 				puts "Buy #{buy_price}"
# 				puts "Sell #{sell_price}"
# 				puts "Profit #{difference}"
# 				print "#{analysis_array} \n \n"
				
				if analysis_array[4] > best_deal[4]
					best_deal = analysis_array
				end
			end
		end
	end
	print "\nBuy on Day: #{best_deal[1]} for a price of $#{best_deal[0]} \nSell on Day: #{best_deal[3]} for a price of $#{best_deal[2]} \nTotal Profit of #{best_deal[4]} \n\n"
	
	
end

test_array = [17,3,6,9,15,8,6,1,10]
stock_picker(test_array)
