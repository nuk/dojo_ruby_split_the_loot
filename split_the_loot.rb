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
		
		
		return split_rec(treasure, 0, result)
	end
	
	def split_rec (treasure, pirate_index, result)
		if(pirate_index < @number_of_pirates)
			chosen_gem = 0
			bad_choices_tries = 0

			while (result[pirate_index].sum < @pirate_share )
				if(chosen_gem == treasure.size)
					unless (result[pirate_index].empty?)
						if(bad_choices_tries == treasure.size)
							return nil
						end
						
						bad_choices_tries += 1
						treasure.insert(-1,result[pirate_index].delete_at(-1))
						chosen_gem = 0
						
					else
						return nil
					end
				end
				if(treasure[chosen_gem]+result[pirate_index].sum > @pirate_share)
					chosen_gem += 1
				else
					result[pirate_index] << treasure.delete_at(chosen_gem)
				end
			end

			return split_rec(treasure, pirate_index+1, result)
		end	
	
		return result
	end
end
