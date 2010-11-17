class SplitTheLoot

	def validate (treasure) 
		if treasure.empty? then
			return true
		end
		
		unless treasure.size() >= @number_of_pirates then	
			return false 
		end
		
		# Verify if the sum of the gems can be divided by the pirates
		unless @sum%@number_of_pirates == 0 then	
			return false 
		end	
		return true
	end

	def split (treasure, number_of_pirates)

		@number_of_pirates = number_of_pirates
				
		@sum = 0
		treasure.each do |gem| 
			@sum += gem
		end
	
		unless validate(treasure)  
			return nil
		end
				
		result = []
		@number_of_pirates.times do |i|
			result << []	
		end
		
		
		split_rec(treasure, 0, result)
		return result
	end
	
	def split_rec (treasure, pirate_index, result)
		if(pirate_index < @number_of_pirates)
			bucket_sum = 0
			while (bucket_sum < @sum/@number_of_pirates )
				gem = treasure.delete_at(0)
				bucket_sum += gem
				result[pirate_index] << gem
				if (bucket_sum > @sum/@number_of_pirates) 
					bucket_sum -= gem
					treasure << result[pirate_index].pop
				end
			end
			split_rec (treasure, pirate_index+1, result)
		end	
	end
end
