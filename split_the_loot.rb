class SplitTheLoot

	def validate (treasure, number_of_pirates) 
		if treasure.empty? then
			return true
		end
		
		unless treasure.size() >= number_of_pirates then	
			return false 
		end
		
		# Verify if the sum of the gems can be divided by the pirates
		unless @sum%number_of_pirates == 0 then	
			return false 
		end	
		return true
	end

	def split (treasure, number_of_pirates)
				
		@sum = 0
		treasure.each do |gem| 
			@sum += gem
		end
	
		unless validate(treasure, number_of_pirates)  
			return nil
		end
				
		result = []
		number_of_pirates.times do |i|
			result << []	
		end
		
		split_rec(treasure, number_of_pirates, 0, result)
				
		return result
	end
	
	def split_rec (treasure, number_of_pirates, pirate_index, result)
		if(pirate_index < number_of_pirates)
			bucket_sum = 0
			while (bucket_sum < @sum/number_of_pirates )
				bucket_sum+=treasure[0]
				result[pirate_index] << treasure.delete_at(0)
			end
			split_rec (treasure, number_of_pirates, pirate_index+1, result)			
		end	
	end
end
