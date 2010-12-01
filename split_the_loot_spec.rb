require "split_the_loot"

describe "SplitTheLoot" do

	before :each do
		@splitter = SplitTheLoot.new
	end
	
	
	describe "Validation" do
		it "should not devide when sum is not divisible by the number of  pirates" do
			@splitter.split([2,3],2).should == nil
		end
		
		it "should not divide when the number of pirates is greater than the number of gems" do
			@splitter.split([3,3],3).should == nil
		end
	end

	it "should return an empty treasure for a single pirate" do
		@splitter.split([],1).should == [[]]
	end
	
	it "should return the treasure for a single pirate" do
		@splitter.split([2,3],1).should == [[2,3]]
	end
	
	it "should distribuite one gem to each pirate" do
		@splitter.split([2,2],2).should == [[2],[2]]
	end
	
	it "should distribuite two gems to each pirate" do
		@splitter.split([2,1,2,1],2).each do |bucket| 
			bucket.sum.should == 3
		end		

	end
		
	it "should distribute two gems to each pirate in desc order" do
		@splitter.split([2,2,1,1],2).each do |bucket| 
			bucket.sum.should == 3
		end		
	end

	it "should distribute different number of gems" do
		@splitter.split([1,6,3,2],2).each do |bucket| 
			bucket.sum.should == 6
		end		
	end
	
	xit "should distribute when the next gem is not a good choice" do
		@splitter.split([8,1, 9,2 ,2,8],3).each do |bucket| 
			bucket.sum.should == 10
		end		
	end
	
	xit "should distribute when the next gem is not a good choice for " do
		@splitter.split([8,1, 8,2 ,2,9],3).each do |bucket| 
			bucket.sum.should == 10
		end		
	end
	
	xit "should distribute when the next gem is not a good choice for the second time" do
		@splitter.split([1, 8,2 ,9],2).each do |bucket| 
			bucket.sum.should == 10
		end		
	end
	
	#TODO motherfocker example
#	it "should distribute when there is a bad choice for the second pirate" do
#		@splitter.split([6,2,2,8,4],2).each do |bucket| 
#			bucket.sum.should == 10
#		end		
#	end
	
	it "should not distribute the undistribuitable" do
		@splitter.split([8,2],2).should == nil
	end
end
