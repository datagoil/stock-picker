def stock_picker(arr)
profit_comparer = 0		#holds value of next day to compare with base profit
profit = 0			#base profit
i = 1				#used to increment and find index of next value to compare
r = 1				#incremented on each loop
length = arr.length		#to determine how many times to run loop comparing profits
days = Hash.new			#hash to hold all profitable days
	arr.each.with_index do |value, index|			#do this for each value in turn
		if (index == (length-1))			#if the value is the last one in array, end the loop
    		  break						#value is current working value
    		end						#index+i is the index of the next value	
    		profit_base = arr[index+i] - value      	#arr[index + i] - value is the difference between working value and next value
		while (r < (length-1))				#r increments to compare against length of array provided by user
          		next if index == length-1		#skips this while statement when last value is reached
          		i += 1					#moves to next value in array to begin comparison
           		break if arr[index+i] == NIL		#leave loop if index of next value is empty
			profit_comparer = arr[index+i] - value	#value of next day to compare with base profit	
			#if difference between current working value and profit comparer value is greater than
			#the differene between previously compared value or base profit value do....         		 
			if profit_comparer > profit_base && profit_comparer > profit
              			profit_base = profit_comparer  	#change profit base to greater profit found
              			buy = index			#set buy date to index of current working value
	    			sell = index + i		#set sell date to index of profit_comparer
	    			days[profit_comparer] = [buy, sell] 	#add the buy,sell indicies to days hash
	    		end
	    		r += 1					#increment the counter
		end
  	        i = 1						#resets index value so we can start over in .each iterator
  	    	r = 1						#resets r so we can start over on while loop
    		if (profit_base > profit)			#if we have found a greater profit
    			profit = profit_base 			#assign greater profit
    		end
 	end
  	p "For the most profit, buy and sell on these days, respecively: #{days.values.max}. Profit is $#{profit}."
	return days.values.max
end

stock_picker([17,3,6,9,15,8,6,1,10,20,])
