class Array
	def sum
		sum = 0
		each do |g|
			sum += g
		end
		sum
	end
end


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
		@pirate_share = @sum/@number_of_pirates		
		result = []
		@number_of_pirates.times do |i|
			result << []	
		end
		
		@number_of_pirates.times do |i|
			unless split_for_pirate(treasure, i, result)
				return nil
			end
		end
		
		return result
	end
	
	def split_for_pirate (treasure, pirate_index, result)
		chosen_gem = 0
		bad_choices_tries = 0
		
		#ateh encher o balde
		while (result[pirate_index].sum < @pirate_share )
		
			# volta atras
			if(chosen_gem == treasure.size)
				return false
			end
			
			
			if(treasure[chosen_gem]+result[pirate_index].sum > @pirate_share)
				#essa gema naum serve
				chosen_gem += 1
				
			else
				# achei uma gema que pode servir
				result[pirate_index] << treasure.delete_at(chosen_gem)
			end
			
			
		end
		return true
	end
end
