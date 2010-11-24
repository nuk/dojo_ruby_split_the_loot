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
			bucket_sum = 0
			chosen_gem = 0
			last_selected_gem_value = 0
			while (bucket_sum < @pirate_share )
				if(chosen_gem == treasure.size)
					if (last_selected_gem_value != 0)
						puts "> #{last_selected_gem_value}"
						bucket_sum = bucket_sum - last_selected_gem_value
						result[pirate_index].delete_at(-1)
						
						treasure.insert(0,last_selected_gem_value)
						chosen_gem = 1
						last_selected_gem_value = 0
						
						puts "#{bucket_sum} : #{pirate_index} : #{treasure.inspect} : #{result[pirate_index].inspect}"
					else
						return nil
					end
				end
				if(treasure[chosen_gem]+bucket_sum > @pirate_share)
					chosen_gem += 1
				else
					gem = treasure.delete_at(chosen_gem)
					bucket_sum += gem
					result[pirate_index] << gem					
					last_selected_gem_value = gem
				end
			end
			return split_rec(treasure, pirate_index+1, result)
		end	
		return result
	end
end
