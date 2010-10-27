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
		
		split_rec(treasure, number_of_pirates, 0, 0,result)
				
		return result
	end
	
	def split_rec (treasure, number_of_pirates, pirate_index, treasure_index, result)
		if(pirate_index < number_of_pirates)
			i = 0
			while (i < @sum/number_of_pirates )
				result[pirate_index] << treasure[treasure_index]
				i+=treasure[treasure_index]
				treasure_index+=1
			end
			split_rec (treasure, number_of_pirates, pirate_index+1, treasure_index, result)			
		end	
	end
end
