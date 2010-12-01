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

		if(treasure.empty?)
			return result
		end
		
		@number_of_pirates.times do |i|
			unless split_for_pirate(treasure, i, result)
				return nil
			end
		end
		
		return result
	end
	
	def split_for_pirate (treasure, pirate_index, result)
	
		banned_gems = []
	
		while(!treasure.empty?)
			next_gem = treasure.delete_at(0)
			if(next_gem + result[pirate_index].sum <= @pirate_share)
				result[pirate_index] << next_gem
				
				if(result[pirate_index].sum == @pirate_share)
					return true
				else
			
					another_treasure = treasure.clone
				
					banned_gems.each do |a|
						another_treasure << a
					end
				
					another_result = []
					result.each do |a|
						another_result << a.clone 
					end				
								
					if split_for_pirate(another_treasure, pirate_index, another_result)
						result.clear
					
						another_result.each do |a|
							result << a
						end
					
						return true
					else
						banned_gems << result[pirate_index].delete_at(-1)
					end
				end

			else
				banned_gems << next_gem
			end
			
		end
		
		return false		
	end
end
